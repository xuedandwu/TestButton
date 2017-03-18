//
//  CoreAnimationViewController.m
//  TestButtonClicked
//
//  Created by Xuedan on 2017/3/6.
//  Copyright © 2017年 Xuedan. All rights reserved.
//

#import "CoreAnimationViewController.h"
#import <objc/runtime.h>

@interface CoreAnimationViewController ()

@end

@implementation CoreAnimationViewController

#define DEGREES_TO_RADIANS(x) (3.14159265358979323846 * x / 180.0)

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    imgv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 64, 100, 200)];
    imgv.backgroundColor = [UIColor blueColor];
    [self.view addSubview:imgv];
    
    UIPageControl *pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 200, 320, 20)];
    pageControl.backgroundColor = [UIColor redColor];
    pageControl.numberOfPages = 5;
    [self.view addSubview:pageControl];
    
//    [self tranAction:nil];
//    
////    [self RightRotateAction:nil];
//    
////    [self Rotate360Action:nil];
//    
//     [self animationInit];
//    
//    [self getPropertyList];
//    [self getIvarList];
//    [self getInstanceMethodList];
//    [self getClassMethodList];
    
    [self logAnyThing];

    
    [self addObserver:self forKeyPath:@"view.frame" options:NSKeyValueObservingOptionNew context:nil];
    
//    tbList = [UITableView new];
//    tbList.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height);
//    tbList.delegate = self;
//    tbList.dataSource = self;
//    [self.view addSubview:tbList];
    
//    dispatch_queue_t queue = dispatch_queue_create("com.demo.serialQueue", DISPATCH_QUEUE_SERIAL);
//    NSLog(@"1"); // 任务1
//    dispatch_async(queue, ^{
//        NSLog(@"2"); // 任务2
//        dispatch_sync(queue, ^{
//            NSLog(@"3"); // 任务3
//        });
//        NSLog(@"4"); // 任务4
//    });
//    NSLog(@"5"); // 任务5
    
//    NSLog(@"1"); // 任务1
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        NSLog(@"2"); // 任务2
//        dispatch_async(dispatch_get_main_queue(), ^{
//            NSLog(@"3"); // 任务3
//        });
//        NSLog(@"4"); // 任务4
//    });
////    while (1) {
////        
////    }
//    NSLog(@"5"); // 任务5
    
//    timer = [NSTimer timerWithTimeInterval:3 target:self selector:@selector(runAny) userInfo:nil repeats:YES];
//    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
//    timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(runAny) userInfo:nil repeats:YES];
}

- (void)logAnyThing{
    unsigned int count;
    //获取属性列表
    objc_property_t *propertyList = class_copyPropertyList([UITextView class], &count);
    for (unsigned int i=0; i<count; i++) {
        const char *propertyName = property_getName(propertyList[i]);
        NSLog(@"property---->%@", [NSString stringWithUTF8String:propertyName]);
    }
    
    //获取方法列表
    Method *methodList = class_copyMethodList([UITextView class], &count);
    for (unsigned int i; i<count; i++) {
        Method method = methodList[i];
        NSLog(@"method---->%@", NSStringFromSelector(method_getName(method)));
    }
    
    //获取成员变量列表
    Ivar *ivarList = class_copyIvarList([UITextView class], &count);
    for (unsigned int i; i<count; i++) {
        Ivar myIvar = ivarList[i];
        const char *ivarName = ivar_getName(myIvar);
        NSLog(@"Ivar---->%@", [NSString stringWithUTF8String:ivarName]);
    }
    
    //获取协议列表
    __unsafe_unretained Protocol **protocolList = class_copyProtocolList([UITextView class], &count);
    for (unsigned int i; i<count; i++) {
        Protocol *myProtocal = protocolList[i];
        const char *protocolName = protocol_getName(myProtocal);
        NSLog(@"protocol---->%@", [NSString stringWithUTF8String:protocolName]);
    }
}

- (void)runAny{
    NSLog(@"5555");
}

#pragma mark --
- (IBAction)tranAction:(id)sender {
    CGPoint fromPoint = imgv.center;
    
    //路径曲线
    UIBezierPath *movePath = [UIBezierPath bezierPath];
    [movePath moveToPoint:fromPoint];
    CGPoint toPoint = CGPointMake(300, 460);
    [movePath addQuadCurveToPoint:toPoint
                     controlPoint:CGPointMake(0,460)];
    //关键帧
    CAKeyframeAnimation *moveAnim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    moveAnim.path = movePath.CGPath;
    moveAnim.removedOnCompletion = YES;
    
    //旋转变化
    CABasicAnimation *scaleAnim = [CABasicAnimation animationWithKeyPath:@"transform"];
    scaleAnim.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    //x，y轴缩小到0.1,Z 轴不变
    scaleAnim.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)];
    scaleAnim.removedOnCompletion = YES;
    
    //透明度变化
    CABasicAnimation *opacityAnim = [CABasicAnimation animationWithKeyPath:@"alpha"];
    opacityAnim.fromValue = [NSNumber numberWithFloat:1.0];
    opacityAnim.toValue = [NSNumber numberWithFloat:0.1];
    opacityAnim.removedOnCompletion = YES;
    
    //关键帧，旋转，透明度组合起来执行
    CAAnimationGroup *animGroup = [CAAnimationGroup animation];
    animGroup.animations = [NSArray arrayWithObjects:moveAnim, scaleAnim,opacityAnim, nil];
    animGroup.duration = 1;
    [imgv.layer addAnimation:animGroup forKey:nil];
}


//旋转并向右移动
- (IBAction)RightRotateAction:(id)sender {
    CGPoint fromPoint = imgv.center;
    UIBezierPath *movePath = [UIBezierPath bezierPath];
    [movePath moveToPoint:fromPoint];
    CGPoint toPoint = CGPointMake(fromPoint.x +100 , fromPoint.y ) ;
    [movePath addLineToPoint:toPoint];
    
    CAKeyframeAnimation *moveAnim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    moveAnim.path = movePath.CGPath;
    
    CABasicAnimation *TransformAnim = [CABasicAnimation animationWithKeyPath:@"transform"];
    TransformAnim.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    
    //沿Z轴旋转
    TransformAnim.toValue = [NSValue valueWithCATransform3D: CATransform3DMakeRotation(M_PI,0,0,1)];
    
    //沿Y轴旋转
    //   scaleAnim.toValue = [NSValue valueWithCATransform3D: CATransform3DMakeRotation(M_PI,0,1.0,0)];
    
    //沿X轴旋转
    //     TransformAnim.toValue = [NSValue valueWithCATransform3D: CATransform3DMakeRotation(M_PI,1.0,0,0)];
    TransformAnim.cumulative = YES;
    TransformAnim.duration =3;
    //旋转2遍，360度
    TransformAnim.repeatCount =2;
    imgv.center = toPoint;
    TransformAnim.removedOnCompletion = YES;
    CAAnimationGroup *animGroup = [CAAnimationGroup animation];
    animGroup.animations = [NSArray arrayWithObjects:moveAnim, TransformAnim, nil];
    animGroup.duration = 6;
    
    [imgv.layer addAnimation:animGroup forKey:nil];
}

//旋转并消除边缘锯齿

- (IBAction)Rotate360Action:(id)sender {
    //图片旋转360度
    CABasicAnimation *animation = [ CABasicAnimation
                                   animationWithKeyPath: @"transform" ];
    animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    
    //围绕Z轴旋转，垂直与屏幕
    animation.toValue = [ NSValue valueWithCATransform3D:
                         CATransform3DMakeRotation(M_PI, 0, 0, 1.0) ];
    animation.duration = 3;
    //旋转效果累计，先转180度，接着再旋转180度，从而实现360旋转
    animation.cumulative = YES;
    animation.repeatCount = 2;
    
    //在图片边缘添加一个像素的透明区域，去图片锯齿
    CGRect imageRrect = CGRectMake(0, 0, imgv.frame.size.width, imgv.frame.size.height);
    UIGraphicsBeginImageContext(imageRrect.size);
    [imgv.image drawInRect:CGRectMake(1,1,imgv.frame.size.width-2,imgv.frame.size.height-2)];
    imgv.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [imgv.layer addAnimation:animation forKey:nil];
}

#pragma mark -
- (void)animationInit
{
    self.view.backgroundColor = [UIColor blackColor];
    
    CGFloat radius = 30.0f;
    CGFloat diameter = radius * 2;
    CGPoint arcCenter = CGPointMake(radius, radius);
    // Create a UIBezierPath for Pacman's open state
    pacmanOpenPath = [UIBezierPath bezierPathWithArcCenter:arcCenter
                                                    radius:radius
                                                startAngle:DEGREES_TO_RADIANS(35)
                                                  endAngle:DEGREES_TO_RADIANS(315)
                                                 clockwise:YES];
    
    [pacmanOpenPath addLineToPoint:arcCenter];
    [pacmanOpenPath closePath];
    
    // Create a UIBezierPath for Pacman's close state
    pacmanClosedPath = [UIBezierPath bezierPathWithArcCenter:arcCenter
                                                      radius:radius
                                                  startAngle:DEGREES_TO_RADIANS(1)
                                                    endAngle:DEGREES_TO_RADIANS(359)
                                                   clockwise:YES];
    [pacmanClosedPath addLineToPoint:arcCenter];
    [pacmanClosedPath closePath];
    
    // Create a CAShapeLayer for Pacman, fill with yellow
    shapeLayer = [CAShapeLayer layer];
    shapeLayer.fillColor = [UIColor yellowColor].CGColor;
    shapeLayer.path = pacmanClosedPath.CGPath;
    shapeLayer.strokeColor = [UIColor grayColor].CGColor;
    shapeLayer.lineWidth = 1.0f;
    shapeLayer.bounds = CGRectMake(0, 0, diameter, diameter);
    shapeLayer.position = CGPointMake(-40, -100);
    [self.view.layer addSublayer:shapeLayer];
    
    SEL startSelector = @selector(startAnimation);
    UIGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:startSelector];
    [self.view addGestureRecognizer:recognizer];
}

- (void)startAnimation {
    // 创建咬牙动画
    CABasicAnimation *chompAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    chompAnimation.duration = 0.25;
    chompAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    chompAnimation.repeatCount = HUGE_VALF;
    chompAnimation.autoreverses = YES;
    // Animate between the two path values
    chompAnimation.fromValue = (id)pacmanClosedPath.CGPath;
    chompAnimation.toValue = (id)pacmanOpenPath.CGPath;
    [shapeLayer addAnimation:chompAnimation forKey:@"chompAnimation"];
    
    // Create digital '2'-shaped path
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 100)];
    [path addLineToPoint:CGPointMake(300, 100)];
    [path addLineToPoint:CGPointMake(300, 200)];
    [path addLineToPoint:CGPointMake(0, 200)];
    [path addLineToPoint:CGPointMake(0, 300)];
    [path addLineToPoint:CGPointMake(300, 300)];
    
    CAKeyframeAnimation *moveAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    moveAnimation.path = path.CGPath;
    moveAnimation.duration = 8.0f;
    // Setting the rotation mode ensures Pacman's mouth is always forward.  This is a very convenient CA feature.
    moveAnimation.rotationMode = kCAAnimationRotateAuto;
    [shapeLayer addAnimation:moveAnimation forKey:@"moveAnimation"];
}

#pragma mark - tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"identifierCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.textLabel.text = @"测试Timer";
    
    return cell;
}

- (void)viewDidDisappear:(BOOL)animated{
    if (timer) {
        [timer invalidate];
        timer = nil;
    }
}

+ (void)classMethod {
    NSLog(@"*** private class methods");
}

//获取类的属性
- (void)getPropertyList {
    //属性个数
    unsigned int count;
    objc_property_t *properties = class_copyPropertyList([UIPageControl class], &count);
    
    for (int i =0; i < count; i++) {
        objc_property_t property = properties[i];
        const char *name =property_getName(property);
        NSString *nameStr = [NSString stringWithCString:name encoding:NSUTF8StringEncoding];
        NSLog(@"***属性名:%@", nameStr);
    }
    free(properties);
}

//获取类的成员变量
- (void)getIvarList {
    unsigned int count;
    Ivar *ivarList = class_copyIvarList([self class], &count);
    for (int i =0; i < count; i++) {
        NSString *nameStr = [NSString stringWithUTF8String:ivar_getName(ivarList[i])];
        NSLog(@"***ivarName:%@", nameStr);
    }
    free(ivarList);
}

//获取一个类的实例方法列表
- (void)getInstanceMethodList {
    unsigned int count;
    Method *methods = class_copyMethodList([self class], &count);
    for (int i =0; i < count; i++) {
        SEL name = method_getName(methods[i]);
        NSLog(@"***实例方法名:%@",NSStringFromSelector(name));
    }
    free(methods);
}

//获取一个类的类方法列表
- (void)getClassMethodList {
    unsigned int count;
    //    const char * class_name = class_getName([self class]);
    //    Class metaClass = objc_getMetaClass(class_name);
    Method *methods =class_copyMethodList(object_getClass([self class]), &count);
    for (int i =0; i < count; i++) {
        SEL name = method_getName(methods[i]);
        NSLog(@"***类方法名:%@",NSStringFromSelector(name));
    }
    free(methods);
}

- (void)privateMethod {
    NSLog(@"*** private instance methods");
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
}

- (void)dealloc{
    NSLog(@"12345");
    [self removeObserver:self forKeyPath:@"view.frame"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

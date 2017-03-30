//
//  ViewController.m
//  TestButtonClicked
//
//  Created by Xuedan on 2017/3/3.
//  Copyright © 2017年 Xuedan. All rights reserved.
//

#import "ViewController.h"
#import "NSDictionary+DeleteNull.h"
#import "PersonModel.h"
#import "CoreAnimationViewController.h"
#import <objc/runtime.h>
#import "NSMutableArray+Extension.h"

static char associatedObjectKey;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    NSMutableArray *aryMu = [NSMutableArray new];
    [aryMu addObject:@"123"];
    [aryMu addObject:nil];

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 100, 100);
    btn.backgroundColor = [UIColor blueColor];
    [self.view addSubview:btn];
    btn.cs_acceptEventInterval = 1.5;
    
    [btn addTarget:self action:@selector(btnclicked) forControlEvents:UIControlEventTouchUpInside];
    
    NSArray* arrStr = @[@"english",@"franch",@"chinese"];
    NSArray* arrCapStr = [arrStr valueForKey:@"capitalizedString"];
    for (NSString* str  in arrCapStr) {
        NSLog(@"%@",str);
    }
    
    NSArray* arrCapStrLength = [arrStr valueForKeyPath:@"capitalizedString.length"];
    for (NSNumber* length  in arrCapStrLength) {
        NSLog(@"%ld",(long)length.integerValue);
    }
    
    UIPageControl *pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 200, 320, 20)];
    pageControl.backgroundColor = [UIColor redColor];
    pageControl.numberOfPages = 5;
    //设置值
    [pageControl setValue:[UIImage imageNamed:@"hm_refresh1"] forKeyPath:@"_currentPageImage"];
    [pageControl setValue:[UIImage imageNamed:@"hm_refresh1"] forKeyPath:@"_pageImage"];
    //读取值
    UIImage *currentImage = [pageControl valueForKey:@"_currentPageImage"];
    
    UIImage *pageImage = [pageControl valueForKey:@"_pageImage"];
    
    [self.view addSubview:pageControl];
    
//    UITextView *txt = [[UITextView alloc] initWithFrame:CGRectMake(0, 230, 320, 100)];
//    txt.font = [UIFont systemFontOfSize:15];
//    txt.textColor = [UIColor blueColor];
//    txt.backgroundColor = [UIColor greenColor];
//    
//    // _placeholderLabel
//    UILabel *placeHolderLabel = [[UILabel alloc] init];
//    placeHolderLabel.text = @"请输入内容";
//    placeHolderLabel.numberOfLines = 0;
//    placeHolderLabel.textColor = [UIColor lightGrayColor];
//    [placeHolderLabel sizeToFit];
//    [txt addSubview:placeHolderLabel];
//    
//    [txt setValue:placeHolderLabel forKeyPath:@"_placeholderLabel"];
//    [self.view addSubview:txt];
    
    
//    _placeholderLabel
    
    add = [Address new];
    
    [add addObserver:self forKeyPath:@"city" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    add.country = @"China";
    add.province = @"Guang Dong";
    add.district = @"Nan Shan";
    NSArray* arr = @[@"country",@"province",@"city",@"district"];
    NSDictionary* dict1 = [add dictionaryWithValuesForKeys:arr]; //把对应key所有的属性全部取出来
    NSLog(@"%@",dict1);
    add.city = @"Shen Zhen";
    add.city = @"Shen Zhen1";
    add.city = @"Shen Zhen2";
    add.city = @"Shen Zhen3";
    add.city = @"Shen Zhen4";
    add.city = @"Shen Zhen5";
    add.city = @"Shen Zhen6";

    
    
    NSDictionary* modifyDict = @{@"country":@"USA",@"province":@"california",@"city":@"Los angle"};
    [add setValuesForKeysWithDictionary:modifyDict];
    NSLog(@"country:%@  province:%@ city:%@",add.country,add.province,add.city);
    
//    [self testOperation];
    
    /*
    //创建
    NSInvocationOperation * invo = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(testNSInvocationOperation) object:nil];
    //执行
//    [invo start];
    
    NSOperationQueue * queue = [[NSOperationQueue alloc]init];
    [queue addOperation:invo];
    */
    
    
//    NSOperationQueue * queue = [[NSOperationQueue alloc] init];
//    [queue addOperationWithBlock:^{
//       
//    }];
    
//    [queue addOperationWithBlock:^{
//        //这里是你想做的操作
//    }];
    
//    [self testOperationQueue];
    
//    NSDictionary *dict = @{@"name":@"xuedan",@"sex":@"男",@"age":@"22"};
//    NSLog(@"dict:%@",dict);
//    
//    NSDictionary *newDict = [NSDictionary changeType:dict];
//    
//    
//    PersonModel *model = [PersonModel new];
//    
//    [model setValuesForKeysWithDictionary:newDict];
//    NSLog(@"newDict:%@",newDict);
//
//    
//    NSLog(@"%@\n%@\n",model.name,model.sex);
//     NSLog(@"model.other=%@",model.other);
    
//    CAGradientLayer *layer = [CAGradientLayer layer];
//    layer.colors = @[(id)[UIColor redColor].CGColor,(id)[UIColor blueColor].CGColor,(id)[UIColor greenColor].CGColor];
//    layer.locations = @[@0.1,@0.7,@1];
//    layer.bounds = CGRectMake(0, 64, 100, 100);
//    layer.position = CGPointMake(100, 100);
//    layer.startPoint = CGPointMake(0, 0);
//    layer.endPoint = CGPointMake(1, 1);
//    [self.view.layer addSublayer:layer];
    
//    CAReplicatorLayer *reLayer = [CAReplicatorLayer layer];
//    reLayer.position = CGPointMake(0, 0);
//    CALayer *layer = [CALayer layer];
//    [reLayer addSublayer:layer];
//    [self.view.layer addSublayer:reLayer];
//    layer.bounds = CGRectMake(0, 0, 20, 20);
//    layer.position = CGPointMake(30, 364);
//    layer.backgroundColor = [UIColor redColor].CGColor;
//    reLayer.instanceTransform = CATransform3DMakeTranslation(25, 0, 0);
//    reLayer.instanceDelay = 1;
//    reLayer.instanceCount = 5;
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.position = CGPointMake(0, 0);
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, 0, 100, 100);
    CGPathAddLineToPoint(path, 0, 300, 100);
    CGPathAddLineToPoint(path, 0, 200, 200);
    CGPathAddLineToPoint(path, 0, 100, 100);
    layer.path = path;
    layer.fillColor = [UIColor redColor].CGColor;
    layer.fillRule = kCAFillRuleEvenOdd;
    layer.strokeColor = [UIColor blueColor].CGColor;
    layer.strokeStart = 0;
    layer.strokeEnd = 0.5;
    layer.lineWidth = 5;
    layer.miterLimit = 1;
    layer.lineJoin = kCALineJoinMiter;
    [self.view.layer addSublayer:layer];
    
//    //绕z轴旋转的动画
//    CABasicAnimation * ani = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
//    //从0度开始
//    ani.fromValue = @0;
//    //旋转到180度
//    ani.toValue = [NSNumber numberWithFloat:M_PI];
//    //时间2S
//    ani.duration = 2;
//    //设置为z轴旋转
////    ani.valueFunction = [CAValueFunction functionWithName:kCAValueFunctionRotateZ];
//    //执行动画
//    [layer addAnimation:ani forKey:@""];
    
    
    CAKeyframeAnimation * ani = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    ani.values = @[[NSValue valueWithCGPoint:CGPointMake(100, 100)],[NSValue valueWithCGPoint:CGPointMake(120, 100)],[NSValue valueWithCGPoint:CGPointMake(120, 200)],[NSValue valueWithCGPoint:CGPointMake(200, 200)]];
    ani.duration = 3;
    [layer addAnimation:ani forKey:@""];
    
    NSString * str = @"123";
    
    objc_setAssociatedObject(str, &associatedObjectKey, @"添加的字符串属性", OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    NSString *string = objc_getAssociatedObject(str, &associatedObjectKey);
    
    NSLog(@"AssociatedObjectKeyNew = %@",string);
    NSLog(@"AssociatedObjectKeyOld = %@",str);
    
}

#pragma mark -- testOperationQueue
- (void)testOperationQueue{
    NSInvocationOperation * op1 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(testNSInvocationOperation1) object:nil];
    NSInvocationOperation * op2 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(testNSInvocationOperation2) object:nil];
    NSOperationQueue * queue = [[NSOperationQueue alloc]init];
    [op2 addDependency:op1];
    [queue addOperation:op1];
    [queue addOperation:op2];
}

- (void)testNSInvocationOperation1
{
    NSLog(@"我是op1  我在第%@个线程",[NSThread currentThread]);
}
- (void)testNSInvocationOperation2
{
    NSLog(@"我是op2 我在第%@个线程",[NSThread currentThread]);
}

#pragma mark --
- (void)testNSInvocationOperation
{
    NSLog(@"我在第%@个线程",[NSThread currentThread]);
}

- (void)btnclicked{
    yyy ++;
    NSLog(@"%d %@",yyy,[NSDate date]);
    
    CoreAnimationViewController *vcCoreAnimation  = [CoreAnimationViewController new];
    vcCoreAnimation.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vcCoreAnimation  animated:YES];
}

- (void)testOperation{
    NSBlockOperation * blockOperation = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"1在第%@个线程",[NSThread currentThread]);
        NSLog(@"1haha");
    }];
    [blockOperation addExecutionBlock:^{
        NSLog(@"2在第%@个线程",[NSThread currentThread]);
        NSLog(@"2haha");
    }];
    [blockOperation addExecutionBlock:^{
        NSLog(@"3在第%@个线程",[NSThread currentThread]);
        NSLog(@"3haha");
    }];
    [blockOperation addExecutionBlock:^{
        NSLog(@"4在第%@个线程",[NSThread currentThread]);
        NSLog(@"4haha");
    }];
    [blockOperation addExecutionBlock:^{
        NSLog(@"5在第%@个线程",[NSThread currentThread]);
        NSLog(@"5haha");
    }];
    [blockOperation addExecutionBlock:^{
        NSLog(@"6在第%@个线程",[NSThread currentThread]);
        NSLog(@"6haha");
    }];
    [blockOperation addExecutionBlock:^{
        NSLog(@"7在第%@个线程",[NSThread currentThread]);
        NSLog(@"7haha");
    }];
    [blockOperation addExecutionBlock:^{
        NSLog(@"8在第%@个线程",[NSThread currentThread]);
        NSLog(@"8haha");
    }];
    [blockOperation addExecutionBlock:^{
        NSLog(@"9在第%@个线程",[NSThread currentThread]);
        NSLog(@"9haha");
    }];
    [blockOperation addExecutionBlock:^{
        NSLog(@"10在第%@个线程",[NSThread currentThread]);
        NSLog(@"10haha");
    }];
    
//    [blockOperation start];
    
    NSOperationQueue * queue = [[NSOperationQueue alloc]init];
    [queue addOperation:blockOperation];
}

#pragma mark - NSFileManager
//获取沙盒根路径
- (void)dirHome{
    NSString * dirHome = NSHomeDirectory();
}

//获取Document目录路径
- (NSString *)dirDoc{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return documentsDirectory;
}

//获取Document目录路径
- (NSString *)dicLib{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *libDirectory = [paths objectAtIndex:0];
    return libDirectory;
}

//获取Cache目录路径
- (NSString *)dicCache{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cacheDirectory = [paths objectAtIndex:0];
    return cacheDirectory;
}

//获取Temp目录路径
- (NSString *)dicTemp{
    NSString *tempDirectory = NSTemporaryDirectory();
    return tempDirectory;
}
//创建文件夹
- (void)createDir{
    NSString *documentPath = [self dirDoc];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *testDirectory = [documentPath stringByAppendingPathComponent:@"test"];
    
    BOOL res = [fileManager createDirectoryAtPath:testDirectory withIntermediateDirectories:YES attributes:nil error:nil];
    if (res) {
        NSLog(@"文件夹创建成功");
    }else
        NSLog(@"文件夹创建失败");
}

//创建文件
- (void)createFile{
    NSString *documentPath = [self dirDoc];
    NSString *testDirectory = [documentPath stringByAppendingPathComponent:@"test"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *testPath = [documentPath stringByAppendingPathComponent:@"test.txt"];
    
    BOOL res = [fileManager createFileAtPath:testPath contents:nil attributes:nil];
    if (res) {
        NSLog(@"文件创建成功");
    }else
        NSLog(@"文件创建失败");
}

//写入
- (void)writeFile{
    NSString *documentPath = [self dirDoc];
    NSString *testDirectory = [documentPath stringByAppendingPathComponent:@"test"];
    NSString *testPath = [testDirectory stringByAppendingPathComponent:@"test.txt"];
    NSString *content = @"测试写入内容";
    BOOL res = [content writeToFile:testPath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    if (res) {
        NSLog(@"文件写入成功");
    }else
        NSLog(@"文件写入失败");
}

//读取
- (void)readFile{
    NSString *documentPath = [self dirDoc];
    NSString *testDirectory = [documentPath stringByAppendingPathComponent:@"test"];
    NSString *testPath = [testDirectory stringByAppendingPathComponent:@"test.txt"];
    
    NSString *content = [NSString stringWithContentsOfFile:testPath encoding:NSUTF8StringEncoding error:nil];
}

#pragma mark - 注意：归档解档需要遵守<NSCoding>协议，实现以下两个方法
//- (void)encodeWithCoder:(NSCoder *)encoder{
//    unsigned int count = 0;
//    
//    objc_property_t *properties = class_copyPropertyList([Address class], &count);
//    
//    for (int i=0; i < count; i ++) {
//        
//        objc_property_t property = properties[i];
//        
//        const char *name = property_getName(property);
//        
//        NSString *key = [NSString stringWithUTF8String:name];
//        
//        [encoder encodeObject:[self valueForKeyPath:key] forKey:key];
//        
//    }
//    
//}
//
//- (instancetype)initWithCoder:(NSCoder *)decoder{
//    
//    //归档存储自定义对象
//    unsigned int count = 0;
//    //获得指向该类所有属性的指针
//    objc_property_t *properties = class_copyPropertyList([Address class], &count);
//    for (int i =0; i < count; i ++) {
//        objc_property_t property = properties[i];        //根据objc_property_t获得其属性的名称--->C语言的字符串
//        const char *name = property_getName(property);
//        NSString *key = [NSString stringWithUTF8String:name];        //解码每个属性,利用kVC取出每个属性对应的数值
//        [self setValue:[decoder decodeObjectForKey:key] forKeyPath:key];
//    }
//    return self;
//    
//}


#pragma mark - KVO
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
    NSString *city = [object valueForKeyPath:keyPath];
    NSLog(@"city:%@",city);
}

- (void)dealloc{
    [add removeObserver:self forKeyPath:@"city"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 100, 100);
    btn.backgroundColor = [UIColor blueColor];
    [self.view addSubview:btn];
    btn.cs_acceptEventInterval = 1.5;
    
    [btn addTarget:self action:@selector(btnclicked) forControlEvents:UIControlEventTouchUpInside];
    
//    [self testOperation];
    
    /*
    //创建
    NSInvocationOperation * invo = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(testNSInvocationOperation) object:nil];
    //执行
//    [invo start];
    
    NSOperationQueue * queue = [[NSOperationQueue alloc]init];
    [queue addOperation:invo];
    */
    
    
//    NSOperationQueue * queue = [[NSOperationQueue alloc]init];
//    [queue addOperationWithBlock:^{
//        //这里是你想做的操作
//    }];
    
//    [self testOperationQueue];
    
    NSDictionary *dict = @{@"name":@"xuedan",@"sex":@"男",@"age":@"22"};
    NSLog(@"dict:%@",dict);
    
    NSDictionary *newDict = [NSDictionary changeType:dict];
    
    
    PersonModel *model = [PersonModel new];
    
    [model setValuesForKeysWithDictionary:newDict];
    NSLog(@"newDict:%@",newDict);

    
    NSLog(@"%@\n%@\n",model.name,model.sex);
//     NSLog(@"model.other=%@",model.other);
    
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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

//
//  NSMutableArray+Extension.m
//  TestButtonClicked
//
//  Created by Xuedan on 2017/3/30.
//  Copyright © 2017年 Xuedan. All rights reserved.
//

#import "NSMutableArray+Extension.h"
#import <objc/runtime.h>

@implementation NSMutableArray(Extension)

+ (void)load{
    Method orginalMethod = class_getInstanceMethod(NSClassFromString(@"__NSArrayM"), @selector(addObject:));
    Method newMethod = class_getInstanceMethod(NSClassFromString(@"__NSArrayM"), @selector(gp_addObject:));
    
    method_exchangeImplementations(orginalMethod, newMethod);
}

- (void)gp_addObject:(id)object{
    if (object != nil) {
        [self gp_addObject:object];
    }
}

@end

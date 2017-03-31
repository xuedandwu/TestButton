//
//  NSMutableDictionary+Extension.m
//  TestButtonClicked
//
//  Created by Xuedan on 2017/3/30.
//  Copyright © 2017年 Xuedan. All rights reserved.
//

#import "NSMutableDictionary+Extension.h"
#import <objc/runtime.h>

@implementation NSMutableDictionary(Extension)

+ (void)load{
    Method orginalMethod = class_getInstanceMethod(NSClassFromString(@"__NSDictionaryM"), @selector(setObject: forKey:));
    Method newMethod = class_getInstanceMethod(NSClassFromString(@"__NSDictionaryM"), @selector(gp_setObject: forKey:));
    
    method_exchangeImplementations(orginalMethod, newMethod);
}

- (void)gp_setObject:(id)object forKey:(id)key{
    if (object != nil) {
        [self gp_setObject:object forKey:key];
    }
}



@end

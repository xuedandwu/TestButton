//
//  PersonModel.m
//  TestButtonClicked
//
//  Created by Xuedan on 2017/3/5.
//  Copyright © 2017年 Xuedan. All rights reserved.
//

#import "PersonModel.h"

@implementation PersonModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
//    if([key isEqualToString:@"id"])
//    {
//        self.age=value;
//    }
    if([key isEqualToString:@"username"])
    {
        self.name=value;
    }
}

@end

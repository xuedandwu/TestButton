//
//  PersonModel.h
//  TestButtonClicked
//
//  Created by Xuedan on 2017/3/5.
//  Copyright © 2017年 Xuedan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PersonModel : NSObject

@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *sex;
//@property (nonatomic,copy) NSString *age;
// @property (nonatomic,copy)NSString *other;


- (void)setValue:(id)value forUndefinedKey:(NSString *)key;

@end

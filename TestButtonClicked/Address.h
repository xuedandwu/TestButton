//
//  Address.h
//  TestButtonClicked
//
//  Created by Xuedan on 2017/3/11.
//  Copyright © 2017年 Xuedan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Address : NSObject

@property (nonatomic,copy) NSString *country;
@property (nonatomic,copy) NSString *province;
@property (nonatomic,copy) NSString *city;
@property (nonatomic,copy) NSString *district;

- (void)setValue:(id)value forUndefinedKey:(NSString *)key;

@end

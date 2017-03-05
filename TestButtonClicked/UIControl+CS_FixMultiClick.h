//
//  UIControl+CS_FixMultiClick.h
//  cheshenzhushou
//
//  Created by Xuedan on 2017/3/3.
//  Copyright © 2017年 ChinaGPS. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@interface UIButton (CS_FixMultiClick)

@property (nonatomic, assign) NSTimeInterval cs_acceptEventInterval; // 重复点击的间隔

@property (nonatomic, assign) NSTimeInterval cs_acceptEventTime;

@end

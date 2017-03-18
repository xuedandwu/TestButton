//
//  CoreAnimationViewController.h
//  TestButtonClicked
//
//  Created by Xuedan on 2017/3/6.
//  Copyright © 2017年 Xuedan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CoreAnimationViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>{
    
    UITableView *tbList;
    
    UIImageView *imgv;
    
    UIBezierPath *pacmanOpenPath,*pacmanClosedPath;
    CAShapeLayer *shapeLayer;
    
    NSTimer *timer;
}

@end

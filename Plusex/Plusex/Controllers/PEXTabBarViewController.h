//
//  PEXTabBarViewController.h
//  Plusex
//
//  Created by rin on 2015/04/04.
//  Copyright (c) 2015年 rin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AwesomeMenu.h"

@interface PEXTabBarViewController : UITabBarController<AwesomeMenuDelegate>

@property(nonatomic, assign) BOOL tabBarHidden;

@property (strong, nonatomic) AwesomeMenu *menu;

@end

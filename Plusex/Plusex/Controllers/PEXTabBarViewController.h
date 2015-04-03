//
//  PEXTabBarViewController.h
//  Plusex
//
//  Created by rin on 2015/04/04.
//  Copyright (c) 2015年 rin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PEXTabBarViewController : UITabBarController

@property(nonatomic, assign) BOOL tabBarHidden;

-(void)addCenterButtonWithImage:(UIImage *)buttonImage highlightImage:(UIImage *)highlightImage target:(id)target action:(SEL)action;

@property(nonatomic, weak) IBOutlet UIButton *centerButton;

@end

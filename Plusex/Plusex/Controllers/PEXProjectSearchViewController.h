//
//  PEXProjectSearchViewController.h
//  Plusex
//
//  Created by rin on 2015/03/29.
//  Copyright (c) 2015年 rin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PEXProjectResutlViewController.h"
#import "PEXSearchViewController.h"

@protocol PEXProjectSearchViewControllerDelegate <NSObject>

@required
-(void) searchProjectWithCondition:(NSDictionary*) condition;

@end

@interface PEXProjectSearchViewController : UIViewController

@property (weak, nonatomic) id <PEXProjectSearchViewControllerDelegate> projectSearchViewControllerDelegate;

@end

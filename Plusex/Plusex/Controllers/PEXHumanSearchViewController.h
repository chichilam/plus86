//
//  PEXHumanSearchViewController.h
//  Plusex
//
//  Created by rin on 2015/03/29.
//  Copyright (c) 2015年 rin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PEXHumanSearchViewControllerDelegate <NSObject>

@required

-(void) searchHumanWithCondition:(NSDictionary*) condition;

@end

@interface PEXHumanSearchViewController : UIViewController

@property (weak, nonatomic) id <PEXHumanSearchViewControllerDelegate> humanSearchViewControllerDelegate;

@end

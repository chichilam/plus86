//
//  PEXHumanSearchViewController.m
//  Plusex
//
//  Created by rin on 2015/03/29.
//  Copyright (c) 2015年 rin. All rights reserved.
//

#import "PEXHumanSearchViewController.h"

@interface PEXHumanSearchViewController ()

- (IBAction)tapProjectButton:(id)sender;
- (IBAction)tapSearchButton:(id)sender;
@end

@implementation PEXHumanSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)tapProjectButton:(id)sender {
    [[PEXSearchViewController shardManager] scrollPageController:UIPageViewControllerNavigationDirectionReverse];
}

- (IBAction)tapSearchButton:(id)sender {
    //FIXME search process
    PEXHumanResultViewController *viewController = [[PEXHumanResultViewController alloc] init];
    
    [self.navigationController pushViewController:viewController animated:YES];
}
@end

//
//  PEXSearchViewController.m
//  Plusex
//
//  Created by rin on 2015/04/04.
//  Copyright (c) 2015年 rin. All rights reserved.
//

#import "PEXSearchViewController.h"

@interface PEXSearchViewController ()<PEXProjectSearchViewControllerDelegate,PEXHumanSearchViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UISegmentedControl *titleSegmentedControl;
@property (strong, nonatomic) IBOutlet UIView *controllerView;

- (IBAction)changeSegmentedControll:(id)sender;

@property (strong, nonatomic) PEXProjectSearchViewController *projectSearchViewController;
@property (strong, nonatomic) PEXHumanSearchViewController *humanSeachViewController;
@property (strong, nonatomic) PEXIntroduceViewController *introduceViewContoller;

@end


@implementation PEXSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
     [self initViewController];
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

-(void) initViewController {
    self.projectSearchViewController = [[PEXProjectSearchViewController alloc] init];
    self.projectSearchViewController.projectSearchViewControllerDelegate = self;
    [self addChildViewController:self.projectSearchViewController];
    [self.projectSearchViewController didMoveToParentViewController:self];
    self.projectSearchViewController.view.frame = self.controllerView.bounds;
    [self.controllerView addSubview:self.projectSearchViewController.view];
    
    self.humanSeachViewController = [[PEXHumanSearchViewController alloc] init];
    self.humanSeachViewController.humanSearchViewControllerDelegate = self;
    self.humanSeachViewController.view.hidden = YES;
    [self addChildViewController:self.humanSeachViewController];
    [self.humanSeachViewController didMoveToParentViewController:self];
    self.humanSeachViewController.view.frame = self.controllerView.bounds;
    [self.controllerView addSubview:self.humanSeachViewController.view];
    
    self.introduceViewContoller = [[PEXIntroduceViewController alloc] init];
    self.introduceViewContoller.view.hidden = YES;
    [self addChildViewController:self.introduceViewContoller];
    [self.introduceViewContoller didMoveToParentViewController:self];
    self.introduceViewContoller.view.frame = self.controllerView.bounds;
    [self.controllerView addSubview:self.introduceViewContoller.view];
}

#pragma mark PEXProjectSearchViewControllerDelegate
-(void) searchProjectWithCondition:(NSDictionary *)condition {
    
    PEXProjectResutlViewController *viewController = [[PEXProjectResutlViewController alloc] init];
    
    [self.tabBarController.navigationController pushViewController:viewController animated:YES];
}

#pragma mark PEXHumanSearchViewControllerDelegate 
-(void) searchHumanWithCondition:(NSDictionary *)condition {
    PEXHumanResultViewController *viewController = [[PEXHumanResultViewController alloc] init];
    
    [self.tabBarController.navigationController pushViewController:viewController animated:YES];

}

- (IBAction)changeSegmentedControll:(id)sender {
    UISegmentedControl *segmentedControl = sender;
    
    if(segmentedControl.selectedSegmentIndex == 0) {
        self.projectSearchViewController.view.hidden = NO;
        self.humanSeachViewController.view.hidden = YES;
        self.introduceViewContoller.view.hidden = YES;
    }
    
    if(segmentedControl.selectedSegmentIndex == 1) {
        self.projectSearchViewController.view.hidden = YES;
        self.humanSeachViewController.view.hidden = NO;
        self.introduceViewContoller.view.hidden = YES;
    }
    
    if(segmentedControl.selectedSegmentIndex == 2) {
        self.projectSearchViewController.view.hidden = YES;
        self.humanSeachViewController.view.hidden = YES;
        self.introduceViewContoller.view.hidden = NO;
    }
}
@end

//
//  PEXStartupViewController.m
//  Plusex
//
//  Created by rin on 2015/03/29.
//  Copyright (c) 2015年 rin. All rights reserved.
//

#import "PEXStartupViewController.h"

@interface PEXStartupViewController ()

@property (weak, nonatomic) IBOutlet UITextField *emailTextFiled;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

- (IBAction)tapLoginButton:(id)sender;
- (IBAction)tapRegisterButton:(id)sender;

@end

@implementation PEXStartupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initView];
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

#pragma mark - initial view
-(void) initView {
    self.emailTextFiled.delegate = self;
    self.passwordTextField.delegate = self;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if(textField == self.emailTextFiled) {
        [self.emailTextFiled resignFirstResponder];
        [self.passwordTextField becomeFirstResponder];
    }
    
    if(textField == self.passwordTextField) {
        [self.passwordTextField resignFirstResponder];
    }
    
    return YES;
}

#pragma mark - tap login button
- (IBAction)tapLoginButton:(id)sender {
    //FIXME login process
    
    PEXTabBarViewController *tabBarController = [[PEXTabBarViewController alloc] init];
    
    PEXSearchViewController *searchViewController = [[PEXSearchViewController alloc] init];
    UINavigationController *sViewController = [[UINavigationController alloc] initWithRootViewController:searchViewController];
    
    PEXManagementViewController *managemnetViewController = [[PEXManagementViewController alloc] init];
    UINavigationController *mNavigationController = [[UINavigationController alloc] initWithRootViewController:managemnetViewController];
    
    PEXUserInfoViewController *userInfoViewController = [[PEXUserInfoViewController alloc] init];
    UINavigationController *uiNavigationController = [[UINavigationController alloc] initWithRootViewController:userInfoViewController];
    
    NSArray *tabs = [NSArray arrayWithObjects:sViewController, mNavigationController, uiNavigationController,nil];
    
    [tabBarController setViewControllers:tabs];
    tabBarController.selectedIndex = 0;
    
    UITabBarItem *tbiSearch = [tabBarController.tabBar.items objectAtIndex:0];
    tbiSearch.title = @"Search";
    
    UITabBarItem *tbiInfo = [tabBarController.tabBar.items objectAtIndex:2];
    tbiInfo.title = @"User Info";
    
    [self.navigationController presentViewController:tabBarController animated:YES completion:nil];
}

#pragma mark - tap regitster button
- (IBAction)tapRegisterButton:(id)sender {
    PEXRegisterViewController *viewController = [[PEXRegisterViewController alloc] init];
    
    [self.navigationController pushViewController:viewController animated:YES];
    
}
@end

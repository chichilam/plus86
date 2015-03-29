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
    
    PEXProjectSearchViewController *projectSearchViewController = [[PEXProjectSearchViewController alloc] init];
    UINavigationController *psNavigationController = [[UINavigationController alloc] initWithRootViewController:projectSearchViewController];
    
    PEXHumanSearchViewController *humanSearchViewController = [[PEXHumanSearchViewController alloc] init];
    UINavigationController *hsNavigationController = [[UINavigationController alloc] initWithRootViewController:humanSearchViewController];
    
    PEXManagementViewController *managemnetViewController = [[PEXManagementViewController alloc] init];
    UINavigationController *mNavigationController = [[UINavigationController alloc] initWithRootViewController:managemnetViewController];
    
    PEXUserInfoViewController *userInfoViewController = [[PEXUserInfoViewController alloc] init];
    UINavigationController *uiNavigationController = [[UINavigationController alloc] initWithRootViewController:userInfoViewController];
    
    NSArray *tabs = [NSArray arrayWithObjects:psNavigationController, hsNavigationController, mNavigationController, uiNavigationController,nil];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    [tabBarController setViewControllers:tabs];
    tabBarController.selectedIndex = 0;
    
    UITabBarItem *tbi1 = [tabBarController.tabBar.items objectAtIndex:0];
    tbi1.title = @"Project";
    
    UITabBarItem *tbi2 = [tabBarController.tabBar.items objectAtIndex:1];
    tbi2.title = @"Human";
    
    UITabBarItem *tbi3 = [tabBarController.tabBar.items objectAtIndex:2];
    tbi3.title = @"Project";
    
    UITabBarItem *tbi4 = [tabBarController.tabBar.items objectAtIndex:3];
    tbi4.title = @"User Info";
    
    [self.navigationController presentViewController:tabBarController animated:YES completion:nil];
}

#pragma mark - tap regitster button
- (IBAction)tapRegisterButton:(id)sender {
    PEXRegisterViewController *viewController = [[PEXRegisterViewController alloc] init];
    
    [self.navigationController pushViewController:viewController animated:YES];
    
}
@end

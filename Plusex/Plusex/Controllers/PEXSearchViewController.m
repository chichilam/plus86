//
//  PEXSearchViewController.m
//  Plusex
//
//  Created by rin on 2015/04/04.
//  Copyright (c) 2015年 rin. All rights reserved.
//

#import "PEXSearchViewController.h"

@interface PEXSearchViewController ()

@property (retain, nonatomic) NSArray *pages;
@property (strong, nonatomic) UIPageViewController *pageController;

@end

@implementation PEXSearchViewController {
    Boolean isFirstRun;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    isFirstRun = YES;
}

-(void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if(isFirstRun) {
        isFirstRun = !isFirstRun;
        
        [self initPageViewController];
    }
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

-(void) initPageViewController {
    PEXProjectSearchViewController *projectSearchViewController = [[PEXProjectSearchViewController alloc] init];
    
    PEXHumanSearchViewController *humanSeachViewController = [[PEXHumanSearchViewController alloc] init];
    
    // load the view controllers in our pages array
    self.pages = [[NSArray alloc] initWithObjects:projectSearchViewController, humanSeachViewController, nil];
    
    self.pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    [self.pageController setDelegate:self];
    [self.pageController setDataSource:self];
    
    [[self.pageController view] setFrame:[[self view] bounds]];
    NSArray *viewControllers = [NSArray arrayWithObject:[self.pages objectAtIndex:0]];
    
    [self.pageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    [self addChildViewController:self.pageController];
    
    [[self view] addSubview:[self.pageController view]];
    [self.pageController didMoveToParentViewController:self];
    
    [self.view sendSubviewToBack:[self.pageController view]];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    NSUInteger currentIndex = [self.pages indexOfObject:viewController];    // get the index of the current view controller on display
    
    // check if we are at the end and decide if we need to present the next viewcontroller
    if ( currentIndex < [self.pages count]-1) {
        return [self.pages objectAtIndex:currentIndex+1];                   // return the next view controller
    } else {
        return nil;                                                         // do nothing
    }
}


- (UIViewController *) pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    NSUInteger currentIndex = [self.pages indexOfObject:viewController];    // get the index of the current view controller on display
    
    // check if we are at the beginning and decide if we need to present the previous viewcontroller
    if ( currentIndex > 0) {
        return [self.pages objectAtIndex:currentIndex-1];                   // return the previous viewcontroller
    } else {
        return nil;                                                         // do nothing
    }
}

@end

//
//  IACTabBarController.m
//  Accessibility 101
//
//  Created by Chris McMeeking on 4/14/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import "IACTabBarController.h"
#import "IACUtilities.h"
#import "IACConstants.h"

@interface IACTabBarController ()<UITabBarControllerDelegate>

@end

@implementation IACTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    
    self.colorDimmed = [IACUtilities colorWithHexString:BLUE];
    self.colorDimmedDarkened = [IACUtilities colorWithHexString:BLUE];
    self.colorSelected = [IACUtilities colorWithHexString:ORANGE];
    self.colorSelectedDarkened = [IACUtilities colorWithHexString:ORANGE];
    self.colorTabBar = [IACUtilities colorWithHexString:LIGHT_BLUE];
    self.colorTabBarDarkened = [IACUtilities colorWithHexString:LIGHT_BLUE];
    self.translucentDarkened = NO;
    self.translucentUndarkened = YES;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
 
    UINavigationItem* navigationItem = [self.navigationController.navigationBar.items objectAtIndex:1];
    
    navigationItem.title = viewController.title;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

//
//  IACAboutViewController.m
//  Accessibility 101
//
//  Created by Jennifer Dailey on 5/21/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import "IACAboutViewController.h"
#import "IACUtilities.h"
#import "IACConstants.h"

@interface IACAboutViewController ()

@property UIColor* backgroundColorView;
@property UIScrollView* scrollView;

@end

@implementation IACAboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.backgroundColorView = [IACUtilities colorWithHexString:BLUE];
    self.scrollView.backgroundColor = self.backgroundColorView;
}

@end

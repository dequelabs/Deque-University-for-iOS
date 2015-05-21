//
//  IACFixedViewController.m
//  Accessibility 101
//
//  Created by Jennifer Dailey on 5/20/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import "IACFixedViewController.h"
#import "IACUtilities.h"
#import "DQConstants.h"

@interface IACFixedViewController ()

@property UIColor* backgroundColorView;

@end

@implementation IACFixedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.backgroundColorView = [IACUtilities colorWithHexString:DQ_COLOR_WORLDSPACE_GREEN];
    self.view.backgroundColor = self.backgroundColorView;
}

@end
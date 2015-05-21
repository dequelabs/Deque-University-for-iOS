//
//  IACFixedViewController.m
//  Accessibility 101
//
//  Created by Jennifer Dailey on 5/20/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import "IACFixedViewController.h"
#import "IACUtilities.h"
#import "IACConstants.h"

@interface IACFixedViewController ()

@property UIColor* backgroundColorView;

@end

@implementation IACFixedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.backgroundColorView = [IACUtilities colorWithHexString:GREEN];
    self.view.backgroundColor = self.backgroundColorView;
}

- (void)createOverlayView {
    [super createOverlayView];
    
    _overlayView.backgroundColor = [IACUtilities colorWithHexString:GREEN];
}

@end
//
//  IACDynamicTypeFixedViewController.m
//  Accessibility 101
//
//  Created by Jennifer Dailey on 5/15/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import "IACDynamicTypeFixedViewController.h"
#import "IACUtilities.h"
#import "IACConstants.h"

@interface IACDynamicTypeFixedViewController ()

@property UIColor* backgroundColorView;

@end

@implementation IACDynamicTypeFixedViewController

-(void) viewDidLoad {
    [super viewDidLoad];
    
    self.backgroundColorView = [IACUtilities colorWithHexString:GREEN];
    self.view.backgroundColor = self.backgroundColorView;
}

@end

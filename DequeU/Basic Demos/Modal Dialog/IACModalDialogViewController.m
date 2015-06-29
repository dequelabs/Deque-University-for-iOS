//
//  IACModalDialogViewController.m
//  DequeU
//
//  Created by Jennifer Dailey on 6/15/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import "IACModalDialogViewController.h"
#import "IACOverlayViewController.h"
#import "IACSplitViewController.h"
#import "IACUtilities.h"
#import "IACConstants.h"

@interface IACModalDialogViewController()

@property IACOverlayViewController* overlayViewController;

@end

@implementation IACModalDialogViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    
    _overlayViewController = [[UIStoryboard storyboardWithName:@"Storyboard" bundle:[NSBundle mainBundle]]
                              instantiateViewControllerWithIdentifier:@"Overlay"];
    
    [_overlayViewController.view setAccessibilityElementsHidden:YES];
    [_overlayViewController.view setHidden:YES];
    [self.view addSubview:_overlayViewController.view];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if([IACSplitViewController overlayIsOn]) {
        _overlayViewController.view.hidden = NO;
    } else {
        _overlayViewController.view.hidden = YES;
    }
}

@end

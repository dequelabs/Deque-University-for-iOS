//
//  IACModalDialogViewController.m
//  DequeU
//
//  Created by Jennifer Dailey on 6/15/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import "IACModalDialogViewController.h"
#import "IACModalDialogFixedViewController.h"
#import "IACViewController.h"
#import "IACUtilities.h"
#import "IACConstants.h"

@interface IACModalDialogViewController() {
    UIView* _overlayViewForModal;
}

@end

@implementation IACModalDialogViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    
    UIViewController* _overlayViewController = [[UIStoryboard storyboardWithName:@"Storyboard" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"Overlay"];
    
    _overlayViewForModal = _overlayViewController.view;
    _overlayViewForModal.accessibilityElementsHidden = YES;
    [self.view addSubview:_overlayViewForModal];
    _overlayViewForModal.hidden = YES;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if([IACViewController overlayIsOn]) {
        _overlayViewForModal.hidden = NO;
    } else {
        _overlayViewForModal.hidden = YES;
    }
}

@end

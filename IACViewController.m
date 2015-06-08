//
//  IACViewController.m
//  Accessibility 101
//
//  Created by Chris McMeeking on 4/14/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import "IACViewController.h"
#import "IACOverlayViewController.h"
#import <DQA11y/DQA11y.h>
#import "IACUtilities.h"
#import "IACConstants.h"

#define OVERLAY_IMAGE_NAME @"DequeU_logo_1024px"

static BOOL _IACViewControllerOverlayIsOn = NO;
static IACViewController* _IACViewControllerActiveInstance = NULL;
static UIButton* _IACOverlayButton = NULL;

@interface IACViewController ()

@property IACOverlayViewController* overlayViewController;

@end

@implementation IACViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (_IACOverlayButton == NULL) {
        _IACOverlayButton =  [UIButton buttonWithType:UIButtonTypeCustom];
        [_IACOverlayButton addTarget:[self class] action:@selector(toggleOverlayOn) forControlEvents:UIControlEventTouchUpInside];
        [_IACOverlayButton setFrame:CGRectMake(0, 0, 30, 21)];
    }
    
    [self createOverlayView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self observeOverlaySetting];

}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [DQViewUtilities findFirstAccessibilityElementInView:self.view].accessibilityTraits |= UIAccessibilityTraitHeader;
}

- (void)viewWillLayoutSubviews {
    self.navigationController.topViewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_IACOverlayButton];

    if (self.navigationController.navigationBar.items.count >= 2) {
        UINavigationItem* navigationItem = [self.navigationController.navigationBar.items objectAtIndex:1];
        
        navigationItem.title = self.title;
    }
}

- (BOOL)shouldAutorotate {
    return NO;
}

//createOverlayView creates the unsighted overlay. The overlay can then be toggled on and off by the user.
- (void)createOverlayView {
    _overlayViewController = [[UIStoryboard storyboardWithName:@"Storyboard" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"Overlay"];
    _overlayViewController.overlayView = (IACOverlayView*) _overlayViewController.view;
    
    
    [self.view addSubview: _overlayViewController.overlayView];
    _overlayViewController.overlayView.hidden = true;
}

+ (void)setOverlayOn:(BOOL)value {
    _IACViewControllerOverlayIsOn = value;
    
    [_IACViewControllerActiveInstance observeOverlaySetting];
}

+ (void)toggleOverlayOn {
    [IACViewController setOverlayOn:!_IACViewControllerOverlayIsOn];
}

+ (UIImage*)getSightedIcon:(BOOL)isOn {
    return isOn ? [UIImage imageNamed:@"DequeU_app_icon_unsighted"] : [UIImage imageNamed:@"DequeU_app_icon_sighted"];
}

- (void)observeOverlaySetting {
    
    _IACViewControllerActiveInstance = self;
    
    [_IACOverlayButton setImage:[self.class getSightedIcon:_IACViewControllerOverlayIsOn] forState:UIControlStateNormal];
    
    if (_IACViewControllerOverlayIsOn) {
        _overlayViewController.overlayView.hidden = false;
    } else {
        _overlayViewController.overlayView.hidden = true;
    }
}

@end

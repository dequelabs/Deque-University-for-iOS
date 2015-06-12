//
//  IACViewController.m
//  Deque University for iOS
//
//  Created by Chris McMeeking on 4/14/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import "IACViewController.h"
#import <DQA11y/DQA11y.h>
#import "IACUtilities.h"
#import "IACConstants.h"
#import "IACOverlayViewController.h"

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
    
    //set up VoiceOver simulation button
    if (_IACOverlayButton == NULL) {
        _IACOverlayButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_IACOverlayButton addTarget:[self class] action:@selector(toggleOverlayOn) forControlEvents:UIControlEventTouchUpInside];
        [_IACOverlayButton setFrame:CGRectMake(0, 0, 30, 21)];
    }
    
    self.screenName = NSStringFromClass([self class]);
    
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

//Creates the physical overlay. The overlay can then be toggled on and off by the user.
- (void)createOverlayView {
    _overlayViewController = [[UIStoryboard storyboardWithName:@"Storyboard" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"Overlay"];
    
    _overlayViewController.view.accessibilityElementsHidden = YES;

    [self.view addSubview: _overlayViewController.view];
    _overlayViewController.view.hidden = true;
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

//Sets the overlay when the viewController loads if VoiceOver Simulation is on.
- (void)observeOverlaySetting {
    
    _IACViewControllerActiveInstance = self;
    
    [_IACOverlayButton setImage:[self.class getSightedIcon:_IACViewControllerOverlayIsOn] forState:UIControlStateNormal];
    
    if (_IACViewControllerOverlayIsOn) {
        _overlayViewController.view.hidden = false;
    } else {
        _overlayViewController.view.hidden = true;
    }
}

@end

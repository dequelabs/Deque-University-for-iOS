//
//  IACSplitViewController.m
//  Deque University for iOS
//
//  Created by Chris McMeeking on 4/14/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import "IACSplitViewController.h"
#import "IACViewController.h"
#import "CustomIOS7AlertView.h"
#import "IACOverlayViewController.h"

static BOOL _IACViewControllerOverlayIsOn = NO;
static IACSplitViewController* _IACSplitViewControllerActiveInstance = NULL;

@interface IACSplitViewController ()<UISplitViewControllerDelegate>

@property IACOverlayViewController* overlayViewController;

@end

@implementation IACSplitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setPreferredDisplayMode:UISplitViewControllerDisplayModeAllVisible];
    
    [self createOverlayView];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self observeOverlaySetting];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    
    [_IACSplitViewControllerActiveInstance observeOverlaySetting];
}

+ (BOOL)overlayIsOn {
    return _IACViewControllerOverlayIsOn;
}

+ (UIImage*)getSightedIcon:(BOOL)isOn {
    return isOn ? [UIImage imageNamed:@"DequeU_app_icon_unsighted"] : [UIImage imageNamed:@"DequeU_app_icon_sighted"];
}

//Sets the overlay when the viewController loads if VoiceOver Simulation is on.
- (void)observeOverlaySetting {
    
    _IACSplitViewControllerActiveInstance = self;
    
    [IACViewController setImageIcon:[IACSplitViewController getSightedIcon:_IACViewControllerOverlayIsOn]]; //Set the image of the Overlay Button.
    
    if (_IACViewControllerOverlayIsOn) {
        _overlayViewController.view.hidden = false;
    } else {
        _overlayViewController.view.hidden = true;
    }
    
    [CustomIOS7AlertView setOverlay:_IACViewControllerOverlayIsOn];
}

@end

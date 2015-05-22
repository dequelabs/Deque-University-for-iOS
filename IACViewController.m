//
//  IACViewController.m
//  Accessibility 101
//
//  Created by Chris McMeeking on 4/14/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import "IACViewController.h"
#import "UIView+DQView.h"
#import "DQConstants.h"
#import "IACUtilities.h"
#import "IACConstants.h"

static BOOL _IACViewControllerOverlayIsOn = NO;
static IACViewController* _IACViewControllerActiveInstance = NULL;
static UIButton* _IACOverlayButton = NULL;

@interface IACOverlayView : UIImageView

@end

@implementation IACOverlayView

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    return NO;
}

@end

@interface IACViewController ()

@property UIColor* backgroundColorView;

@end

@implementation IACViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.backgroundColorView = [IACUtilities colorWithHexString:ORANGE];
    self.view.backgroundColor = self.backgroundColorView;
    
    if (_IACOverlayButton == NULL) {
        _IACOverlayButton =  [UIButton buttonWithType:UIButtonTypeCustom];
        [_IACOverlayButton addTarget:[self class] action:@selector(toggleOverlayOn) forControlEvents:UIControlEventTouchUpInside];
        [_IACOverlayButton setFrame:CGRectMake(0, 0, 30, 21)];
    }
    
    [self createOverlayView];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    UIView* firstAccessibilityElement = [self.view findFirstAccessibilityElement];

    firstAccessibilityElement.accessibilityTraits |= UIAccessibilityTraitHeader;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self observeOverlaySetting];
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

- (void)createOverlayView {
    
    _overlayView = [[IACOverlayView alloc] init];
    
    _overlayView.backgroundColor = [IACUtilities colorWithHexString:GRAY];
    _overlayView.isAccessibilityElement = NO;
    _overlayView.translatesAutoresizingMaskIntoConstraints = NO;
    
    
    [self.view addSubview:_overlayView];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_overlayView
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:1
                                                           constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_overlayView
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeHeight
                                                         multiplier:1
                                                           constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_overlayView
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1
                                                           constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_overlayView
                                                          attribute:NSLayoutAttributeCenterY
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterY
                                                         multiplier:1
                                                           constant:0]];
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
        _overlayView.hidden = false;
    } else {
        _overlayView.hidden = true;
    }
}

@end

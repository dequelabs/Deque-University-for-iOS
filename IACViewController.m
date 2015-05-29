//
//  IACViewController.m
//  Accessibility 101
//
//  Created by Chris McMeeking on 4/14/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import "IACViewController.h"
#import "UIView+DQView.h"
#import "IACUtilities.h"
#import "IACConstants.h"
#import "DQLabel.h"

#define OVERLAY_IMAGE_NAME @"DequeU_logo"

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

@property UIColor* backgroundColor;

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
    
    UIImageView* _overlayImage = [[UIImageView alloc] init];
    _overlayImage.image = [UIImage imageNamed:OVERLAY_IMAGE_NAME];
    _overlayImage.isAccessibilityElement = NO;
    _overlayImage.contentMode = UIViewContentModeScaleAspectFit;
    _overlayImage.translatesAutoresizingMaskIntoConstraints = NO;
    
    DQLabel* _titleLabel = [[DQLabel alloc] init];
    _titleLabel.numberOfLines = 0;
    _titleLabel.text = @"Deque University for iOS";
    _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _titleLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    
    DQLabel* _overlayNameLabel = [[DQLabel alloc] init];
    _overlayNameLabel.numberOfLines = 0;
    _overlayNameLabel.text = @"VoiceOver Simulation";
    _overlayNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _overlayNameLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
    
    [self.view addSubview:_overlayView];
    [_overlayView addSubview:_overlayImage];
    [_overlayView addSubview:_titleLabel];
    [_overlayView addSubview:_overlayNameLabel];
    
    //constraints for Overlay View
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
    
    //constraints for Deque U Logo
    [_overlayView addConstraint:[NSLayoutConstraint constraintWithItem:_overlayImage
                                                             attribute:NSLayoutAttributeWidth
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:_overlayView
                                                             attribute:NSLayoutAttributeWidth
                                                            multiplier:0.6666
                                                              constant:0]];
    
    [_overlayView addConstraint:[NSLayoutConstraint constraintWithItem:_overlayImage
                                                          attribute:NSLayoutAttributeCenterY
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:_overlayView
                                                          attribute:NSLayoutAttributeCenterY
                                                         multiplier:1
                                                           constant:0]];
    
    [_overlayView addConstraint:[NSLayoutConstraint constraintWithItem:_overlayImage
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:_overlayView
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1
                                                           constant:0]];
    
    [_overlayImage addConstraint:[NSLayoutConstraint constraintWithItem:_overlayImage
                                                              attribute:NSLayoutAttributeHeight
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:_overlayImage
                                                              attribute:NSLayoutAttributeWidth
                                                             multiplier:8.0/5.0
                                                               constant:0]];
    
    //constraints for Deque U Title
    [_overlayView addConstraint:[NSLayoutConstraint constraintWithItem:_titleLabel
                                                             attribute:NSLayoutAttributeCenterX
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:_overlayView
                                                             attribute:NSLayoutAttributeCenterX
                                                            multiplier:1
                                                              constant:0]];
    
    [_overlayView addConstraint:[NSLayoutConstraint constraintWithItem:_titleLabel
                                                             attribute:NSLayoutAttributeBottom
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:_overlayImage
                                                             attribute:NSLayoutAttributeBottom
                                                            multiplier:1
                                                              constant:-20]];
    
    //constraints for VoiceOver Simulation
    [_overlayView addConstraint:[NSLayoutConstraint constraintWithItem:_overlayNameLabel
                                                             attribute:NSLayoutAttributeCenterX
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:_overlayView
                                                             attribute:NSLayoutAttributeCenterX
                                                            multiplier:1
                                                              constant:0]];
    
    [_overlayView addConstraint:[NSLayoutConstraint constraintWithItem:_overlayNameLabel
                                                             attribute:NSLayoutAttributeTop
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:_titleLabel
                                                             attribute:NSLayoutAttributeBottom
                                                            multiplier:1
                                                              constant:30]];
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

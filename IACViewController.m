//
//  IACViewController.m
//  Accessibility 101
//
//  Created by Chris McMeeking on 4/14/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import "IACViewController.h"
#import "UIView+DQView.h"
#import "DQLog.h"
#import "DQConstants.h"
#import "IACUtilities.h"
#import "IACConstants.h"
#import "IACNavigationController.h"

#define VIEW_TAG_SWITCH 987654321
#define VIEW_TAG_BOTTOM 111111111
#define VIEW_TAG_TOP 999999999
#define VIEW_TAG_OVERLAY 666

#define LOG_FLAG YES

@interface IACOverlayView : UIView

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

    self.backgroundColorView = [IACUtilities colorWithHexString:DARK_BLUE];
    self.view.backgroundColor = self.backgroundColorView;
    
    _overlayButton =  [UIButton buttonWithType:UIButtonTypeCustom];
    [_overlayButton setImage:[self addImage] forState:UIControlStateNormal];
    [_overlayButton addTarget:self action:@selector(changeObnoxiousOverlay) forControlEvents:UIControlEventTouchUpInside];
    [_overlayButton setFrame:CGRectMake(0, 0, 30, 21)];
    self.navigationController.topViewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_overlayButton];
    
    [self createOverlayView];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    UIView* firstAccessibilityElement = [self.view findFirstAccessibilityElement];
    
    firstAccessibilityElement.accessibilityTraits |= UIAccessibilityTraitHeader;

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self setObnoxiousOverlay];
}

- (void)viewWillLayoutSubviews {
    if (self.navigationController.navigationBar.items.count >= 2) {
        UINavigationItem* navigationItem = [self.navigationController.navigationBar.items objectAtIndex:1];
        
        navigationItem.title = self.title;
    }
}

- (BOOL)shouldAutorotate {
    return NO;
}

- (UIImage*)addImage {
    return overlayOn ? [UIImage imageNamed:@"DequeU_app_icon_unsighted"] : [UIImage imageNamed:@"DequeU_app_icon_sighted"];
}

- (void)createOverlayView {
    UIView* bottomView = [self.view viewWithTag:VIEW_TAG_BOTTOM];
    UIView* topView = [self.view viewWithTag:VIEW_TAG_TOP];
    
    _overlayView = [[IACOverlayView alloc] init];
    
    _overlayView.backgroundColor = [IACUtilities colorWithHexString:DARK_BLUE];
    _overlayView.isAccessibilityElement = NO;
    _overlayView.translatesAutoresizingMaskIntoConstraints = NO;
    
    
    [self.view addSubview:_overlayView];
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:topView
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:_overlayView
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1
                                                           constant:10]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:bottomView
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:_overlayView
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1
                                                           constant:-20]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_overlayView
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:1
                                                           constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:_overlayView
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1
                                                           constant:0]];
}

- (void)changeObnoxiousOverlay {
    
    overlayOn = !overlayOn;
    [self setObnoxiousOverlay];
}

- (void)setObnoxiousOverlay {

    [_overlayButton setImage:[self addImage] forState:UIControlStateNormal];
    
    if (overlayOn) {
        _overlayView.hidden = false;
    } else {
        _overlayView.hidden = true;
    }
}


@end

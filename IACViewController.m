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
    UISwitch* overlaySwitch = (UISwitch*)[self.view viewWithTag:VIEW_TAG_SWITCH];
    
    if (overlaySwitch) {
        [overlaySwitch addTarget:self action:@selector(addObnoxiousOverlay) forControlEvents:UIControlEventValueChanged];
    }
    
    self.backgroundColorView = [IACUtilities colorWithHexString:DQ_COLOR_WORLDSPACE_BLUE];
    self.view.backgroundColor = self.backgroundColorView;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    UIView* firstAccessibilityElement = [self.view findFirstAccessibilityElement];
    
    firstAccessibilityElement.accessibilityTraits |= UIAccessibilityTraitHeader;

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

- (void)addObnoxiousOverlay {
    UISwitch* overlaySwitch = (UISwitch*)[self.view viewWithTag:VIEW_TAG_SWITCH];
    
    if (overlaySwitch.on) {
    
        UIView* bottomView = [self.view viewWithTag:VIEW_TAG_BOTTOM];
        UIView* topView = [self.view viewWithTag:VIEW_TAG_TOP];
        
        UIView* overlayView = [[IACOverlayView alloc] init];
        
        overlayView.backgroundColor = [IACUtilities colorWithHexString:DQ_COLOR_WORLDSPACE_BLUE];
        overlayView.tag = VIEW_TAG_OVERLAY;
        overlayView.isAccessibilityElement = NO;
        overlayView.translatesAutoresizingMaskIntoConstraints = NO;

        
        [self.view addSubview:overlayView];
        
        
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:topView
                                                               attribute:NSLayoutAttributeTop
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:overlayView
                                                               attribute:NSLayoutAttributeTop
                                                              multiplier:1
                                                                constant:0]];
        
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:bottomView
                                                                attribute:NSLayoutAttributeBottom
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:overlayView
                                                                attribute:NSLayoutAttributeBottom
                                                               multiplier:1
                                                                 constant:0]];
        
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:overlayView
                                                                attribute:NSLayoutAttributeWidth
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.view
                                                                attribute:NSLayoutAttributeWidth
                                                               multiplier:1
                                                                 constant:0]];
        
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.view
                                                                attribute:NSLayoutAttributeCenterX
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:overlayView
                                                                attribute:NSLayoutAttributeCenterX
                                                               multiplier:1
                                                                 constant:0]];
    } else {
        [[self.view viewWithTag:VIEW_TAG_OVERLAY] removeFromSuperview];
    }
    
}


@end

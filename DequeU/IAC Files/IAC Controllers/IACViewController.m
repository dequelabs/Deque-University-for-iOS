//
//  IACViewController.m
//  Deque University for iOS
//
//  Created by Chris McMeeking on 4/14/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import <DQA11y/DQA11y.h>
#import "IACViewController.h"
#import "IACSplitViewController.h"

#define OVERLAY_IMAGE_NAME @"DequeU_logo_1024px"

static UIButton* _IACOverlayButton = NULL;

@implementation IACViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //set up VoiceOver simulation button
    if (_IACOverlayButton == NULL) {
        _IACOverlayButton =  [UIButton buttonWithType:UIButtonTypeCustom];
        [_IACOverlayButton addTarget:[self class] action:@selector(toggleOverlayOn) forControlEvents:UIControlEventTouchUpInside];
        [_IACOverlayButton setFrame:CGRectMake(0, 0, 30, 21)];
    }
    
    self.screenName = NSStringFromClass([self class]);
}

- (void)viewDidAppear:(BOOL)animated {
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

+ (void)toggleOverlayOn {
    [IACSplitViewController setOverlayOn:![IACSplitViewController overlayIsOn]];
}

+ (void)setImageIcon:(UIImage*)image {
    [_IACOverlayButton setImage:image forState:UIControlStateNormal];
}

@end

//
//  DQViewController.m
//  FormValidation
//
//  Created by Chris McMeeking on 4/13/15.
//  Copyright (c) 2015 Deque Developer. All rights reserved.
//

#import "DQViewController.h"

/**
 * ???
 */
@implementation DQViewController

- (id)init {
    self = [super init];
    
    if (self) {
        [self initialize];
    }
    
    return self;
}


- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        [self initialize];
    }
    
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        [self initialize];
    }
    
    return self;
}


- (void)initialize {
    
}

- (void) viewDidLoad {
    [super viewDidLoad];
    
    [self findFirstAccessibilityElement:self.view].accessibilityTraits |= UIAccessibilityTraitHeader;
}

/**
 * Finds the first accessibility element in the view and returns it.
 */
- (UIView*)findFirstAccessibilityElement:(UIView*)view {
    for (UIView* subView in [view.subviews sortedArrayUsingComparator:comparatorBlock]) {
        
        if (subView.isAccessibilityElement) {
            return subView;
        } else {
            UIView* temp = [self findFirstAccessibilityElement:subView];
            
            if (temp) {
                return temp;
            }
        }
    }
    
    return nil;
}

NSComparator comparatorBlock = ^(UIView *obj1, UIView *obj2) {
    if (obj1.frame.origin.y > obj2.frame.origin.y) {
        return (NSComparisonResult)NSOrderedDescending;
    }
    
    if (obj1.frame.origin.y < obj2.frame.origin.y) {
        return (NSComparisonResult)NSOrderedAscending;
    }
    return (NSComparisonResult)NSOrderedSame;
};

@end

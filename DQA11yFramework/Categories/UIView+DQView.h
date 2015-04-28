//
//  UIView+DQView.h
//  Accessibility 101
//
//  Created by Chris McMeeking on 4/17/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (DQView)

+ (NSComparator)comparatorPositionYThenX;

- (UIView*)findFirstAccessibilityElement;

- (UIView*)findFirstAccessibilityElementUsingComparator:(NSComparator)comparator;

- (UIView*)findFirstActiveElement;

- (void)printViewHeirarchy;

@end

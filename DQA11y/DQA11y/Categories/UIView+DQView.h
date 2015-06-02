//
//  UIView+DQView.h
//  Accessibility 101
//
//  Created by Chris McMeeking on 4/17/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 * Overwriting UIView for additional helpful accessibility features.
 */

@interface UIView (DQView)

+ (NSComparator)comparatorPositionYThenX;

/**
 * This returns how two elements compare in positions with Y being compared before
 * X.
 */

- (UIView*)findFirstAccessibilityElement; ///< Finds and returns the first accessibility element in the view

- (UIView*)findFirstAccessibilityElementUsingComparator:(NSComparator)comparator; ///< Finds and returns the first accessibility element in the view
                                                                                  ///< given a comparator

- (UIView*)findFirstActiveElement; ///< Finds and returns the first active element in the view

- (void)printViewHeirarchy; ///< Prints the view heirarchy

@end

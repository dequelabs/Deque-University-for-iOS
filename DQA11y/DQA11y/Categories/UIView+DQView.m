//
//  UIView+DQView.m
//  Accessibility 101
//
//  Created by Chris McMeeking on 4/17/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import "UIView+DQView.h"
#import "DQLog.h"

@implementation UIView (DQView)

- (UIView*)findFirstAccessibilityElementUsingComparator:(NSComparator)comparator {
    if (self.isAccessibilityElement) return self;
    
    for (UIView* subView in [self.subviews sortedArrayUsingComparator:comparator]) {
        
        UIView* temp = [subView findFirstAccessibilityElementUsingComparator:comparator];
        
        if (temp) return temp;
    }
    
    return nil;
}

- (UIView*)findFirstAccessibilityElement {
    return [self findFirstAccessibilityElementUsingComparator:[UIView comparatorPositionYThenX]];
}

+ (NSComparator)comparatorPositionYThenX {
    return ^(UIView *obj1, UIView *obj2) {
        if (obj1.frame.origin.y > obj2.frame.origin.y) {
            return (NSComparisonResult)NSOrderedDescending;
        } else if (obj1.frame.origin.y < obj2.frame.origin.y) {
            return (NSComparisonResult)NSOrderedAscending;
        } else {
            if (obj1.frame.origin.x > obj2.frame.origin.x) {
                return (NSComparisonResult)NSOrderedDescending;
            } else if (obj1.frame.origin.x < obj2.frame.origin.x) {
                return (NSComparisonResult)NSOrderedAscending;
            } else {
                return (NSComparisonResult)NSOrderedSame;
            }
        }
    };
}

- (BOOL)isActiveElement {
    if ([self isKindOfClass:[UIButton class]]) {
        return YES;
    } else if ([self isKindOfClass:[UISwitch class]]) {
        return YES;
    } else if ([self isKindOfClass:[UITextField class]]) {
        return YES;
    } else {
        return NO;
    }
}

- (UIView*)findFirstActiveElement {
    
    if ([self isActiveElement]) return self;
    
    for (UIView* subView in self.subviews) {
        
        UIView* temp = [subView findFirstActiveElement];
        
        if (temp) return temp;
    }
    
    return nil;
}

- (void)printViewHeirarchy {
    [self printViewHeirarchyAtDepth:0];
}

/**
 * This function loops through, printing the depth of each element in the view
 */

- (void)printViewHeirarchyAtDepth:(int)depth {
    for (UIView* view in self.subviews) {
        NSLog(@"%*s%@", depth*2, " ", view);
        [view printViewHeirarchyAtDepth:depth+1];
    }
}

@end

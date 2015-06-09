//
//  IACTableViewCell.m
//  Accessibility 101
//
//  Created by Jennifer Dailey on 5/22/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import "IACTableViewCell.h"

#define OVERLAY_SWITCH_TAG 92

@implementation IACTableViewCell

/** 
 * Makes the accessibility label for the Table View Cell dynamic - it alerts the user if the overlay switch is on or not.
 */
- (NSString*) accessibilityLabel {
    
    NSString* accessibilityLabelAlert;
    UISwitch* overlaySwitch = (UISwitch*)[self viewWithTag:OVERLAY_SWITCH_TAG];
    
    if(overlaySwitch.on) {
        accessibilityLabelAlert = [NSLocalizedString(@"OVERLAY", nil) stringByAppendingString:NSLocalizedString(@"ON", nil)];
    } else {
        accessibilityLabelAlert = [NSLocalizedString(@"OVERLAY", nil) stringByAppendingString:NSLocalizedString(@"OFF", nil)];
    }
    
    return accessibilityLabelAlert;
}

@end

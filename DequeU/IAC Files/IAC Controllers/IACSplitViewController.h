//
//  IACSplitViewController.h
//  Deque University for iOS
//
//  Created by Chris McMeeking on 4/14/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import <UIKit/UIKit.h>

//! View Controller used to show both the menu and the demo when using an iPad
@interface IACSplitViewController : UISplitViewController

//! Retrieves the image for the VoiceOver simulation toggle button, which depends on whether or not the simulation is on.
/*!
 * \param isOn is a BOOL, indicating if the simulation is currently on.
 * \returns the UIImage of the corresponding VoiceOver simulation button.
 */
+ (UIImage*)getSightedIcon:(BOOL)isOn;

//! States whether the overlay is on or not.
/*! \returns a BOOL, stating if the overlay is on. */
+ (BOOL)overlayIsOn;

//! Helper function for turning the VoiceOver simulation on/off.
/*! \param value is a BOOL, indicating if the simulation should be on or off. */
+ (void)setOverlayOn:(BOOL)value;

@end

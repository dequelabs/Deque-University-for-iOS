//
//  IACViewController.h
//  Deque University for iOS
//
//  Created by Chris McMeeking on 4/14/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GAITrackedViewController.h"

//! Deque University for iOS View Controller.
/*! This view controller manages the different sections and tabs on iPhone and iPod touch. */
@interface IACViewController : GAITrackedViewController

@property (readonly) UIButton* overlayButton; ///< The button that toggles the VoiceOver simulation.

//! Retrieves the image for the VoiceOver simulation toggle button, which depends on whether or not the simulation is on.
/*!
 * \param isOn is a BOOL, indicating if the simulation is currently on.
 * \returns the UIImage of the corresponding VoiceOver simulation button.
 */
+ (UIImage*)getSightedIcon:(BOOL)isOn;

//! Helper function for turning the VoiceOver simulation on/off.
/*!
 * \param value is a BOOL, indicating if the simulation should be on or off.
 */
+ (void)setOverlayOn:(BOOL)value;

//! Calls setOverlayOn to turn the VoiceOver simulation on or off.
/*! This function will turn the simulation on if it is currently off, or off if the simulation is currently on. */
+ (void)toggleOverlayOn;

@end

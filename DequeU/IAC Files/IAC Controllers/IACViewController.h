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
@interface IACViewController : UIViewController

//! Calls setOverlayOn to turn the VoiceOver simulation on or off.
/*! This function will turn the simulation on if it is currently off, or off if the simulation is currently on. */
+ (void)toggleOverlayOn;

//! Sets the Overlay Button image according to whether the VoiceOver Simulation is on or not.
/*! \param image is the button's UIImage. */
+ (void)setImageIcon:(UIImage*)image;

@end

//
//  IACViewController.h
//  Accessibility 101
//
//  Created by Chris McMeeking on 4/14/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GAITrackedViewController.H"

/**
 * Deque University for iOS View Controller.
 * This view controller manages the different sections and tabs on iPhone and iPod touch.
 */
@interface IACViewController : GAITrackedViewController {
    UIView* _overlayView;
}

@property (readonly) UIView* overlayView; ///< The unsighted overlay
@property (readonly) UIButton* overlayButton; ///< The button that toggles the unsighted overlay

+ (UIImage*)getSightedIcon:(BOOL)isOn; ///< image for when the overlay is on
+ (void)setOverlayOn:(BOOL)value; ///< Helper function for turning the overlay on
+ (void)toggleOverlayOn; ///< Calls setOverlayOn to toggle the overlay on or off

@end

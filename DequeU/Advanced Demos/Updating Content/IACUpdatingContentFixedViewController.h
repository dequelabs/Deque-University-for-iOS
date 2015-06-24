//
//  IACUpdatingContentFixedViewController.h
//  Deque University for iOS
//
//  Created by Jennifer Dailey on 6/22/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import "IACViewController.h"
#import <DQA11y/DQA11y.h>

//! The accessible (fixed) version of the Updating Content demonstration.
@interface IACUpdatingContentFixedViewController : IACViewController

@property (nonatomic, strong) NSTimer *myTimer; ///< Counter for Progress Bar.
@property (strong, nonatomic) UIProgressView *progressView; ///< The Progress Bar.
@property (nonatomic, strong) IBOutlet DQLabel *progressLabel; ///< Label showing the progress of the Progress Bar.
@property (weak, nonatomic) IBOutlet UIView *wrapperView; ///< The view containing the Progress Bar and progressLabel.
@property (weak, nonatomic) IBOutlet DQButton *buttonToChangeProgress; ///< The "Start" and "Stop" button.

//! Pauses or restarts the Progress Bar, depending on what buttonToChangeProgress currently displays. Called by buttonToChangeProgress.
- (void)stopOrRestartProgressBar;

//! Increases the Progress Bar, updates the label displaying its progress, and posts accessibility notifications if Progress Bar completes.
/*!
 \param timer is an NSTimer that calls updateProgressBar every second.
 \returns an NSString of the accessibility notification that is posted or nil if no notification is posted. This is used for testing purposes.
 */
- (NSString*)updateProgressBar:(NSTimer *)timer;

@end

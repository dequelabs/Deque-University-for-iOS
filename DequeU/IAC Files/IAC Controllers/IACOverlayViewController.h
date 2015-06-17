//
//  IACOverlayView.h
//  Deque University for iOS
//
//  Created by Jennifer Dailey on 6/5/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import <UIKit/UIKit.h>

//! Overlay used for the VoiceOver Simulation
@interface IACOverlayView : UIView

@end

//! ViewController that contains an IACOverlayView
@interface IACOverlayViewController : UIViewController

@property IACOverlayView *overlayView;

@end
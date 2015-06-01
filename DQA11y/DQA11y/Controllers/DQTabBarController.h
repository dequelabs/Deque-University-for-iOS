//
//  DQTabBarController.h
//  Accessibility 101
//
//  Created by Chris McMeeking on 4/14/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 * This is a Tab Bar Controller that automatically reacts to the "Darken Colors" accessibility feature
 */

@interface DQTabBarController : UITabBarController

@property (strong, atomic) UIColor* colorDimmed; ///< Color of item not selected on the tab bar controller
@property (strong, atomic) UIColor* colorDimmedDarkened; ///< Color of item not selected on the tab bar controller (when "Darken Colors" is turned on)
@property (strong, atomic) UIColor* colorSelected; ///< Color of item selected on the tab bar controller
@property (strong, atomic) UIColor* colorSelectedDarkened; ///< Color of item selected on the tab bar controller (when "Darken Colors" is turned on)
@property (strong, atomic) UIColor* colorTabBar; ///< Color of the Tab Bar
@property (strong, atomic) UIColor* colorTabBarDarkened; ///< Color of the Tab Bar (when "Darken Colors" is turned on)
@property (atomic) BOOL translucentUndarkened; ///< Variable storing whether or not translucency should be turned on when "Darken Colors" is off
@property (atomic) BOOL translucentDarkened; ///< Variable storing whether or not translucency should be turned on when "Darken Colors" is on

@end

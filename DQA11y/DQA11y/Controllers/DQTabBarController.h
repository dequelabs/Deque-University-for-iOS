//
//  DQTabBarController.h
//  Accessibility 101
//
//  Created by Chris McMeeking on 4/14/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DQTabBarController : UITabBarController

@property (strong, atomic) UIColor* colorDimmed;
@property (strong, atomic) UIColor* colorDimmedDarkened;
@property (strong, atomic) UIColor* colorSelected;
@property (strong, atomic) UIColor* colorSelectedDarkened;
@property (strong, atomic) UIColor* colorTabBar;
@property (strong, atomic) UIColor* colorTabBarDarkened;
@property (atomic) BOOL translucentUndarkened;
@property (atomic) BOOL translucentDarkened;

@end

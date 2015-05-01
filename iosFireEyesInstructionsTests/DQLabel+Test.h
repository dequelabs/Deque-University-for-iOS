//
//  DQLabel+Test.h
//  Accessibility 101
//
//  Created by Meng Du on 5/1/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#ifndef Accessibility_101_DQLabel_Test_h
#define Accessibility_101_DQLabel_Test_h

#import "IACLabelBrokenViewController.h"
#import "IACLabelFixedViewController.h"


@interface IACLabelBrokenViewController (test)

@property (readonly) UIButton *dogDisplay;
@property (readonly) UIButton *catDisplay;
@property (readonly) UIButton *fishDisplay;
@property (readonly) UIImageView *imageView;

@end



@interface IACLabelFixedViewController (test)

@property (readonly) UIButton *dogDisplay;
@property (readonly) UIButton *catDisplay;
@property (readonly) UIButton *fishDisplay;
@property (readonly) UIImageView *imageView;

@end


#endif

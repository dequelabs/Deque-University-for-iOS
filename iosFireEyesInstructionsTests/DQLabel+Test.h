//
//  DQLabel+Test.h
//  Accessibility 101
//
//  Created by Meng Du on 4/9/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#ifndef Accessibility_101_DQLabel_Test_h
#define Accessibility_101_DQLabel_Test_h

#import "DQLabelExampleViewController.h"
#import "DQBrokenLabelViewController.h"
#import "IACLabelFixedViewController.h"


@interface DQLabelExampleViewController (test)

@property (readonly) UILabel *exampleLabel;
@property (readonly) UILabel *dogLabel;
@property (readonly) UILabel *catLabel;
@property (readonly) UILabel *fishLabel;
@property (readonly) UIButton *dogDisplay;
@property (readonly) UIButton *catDisplay;
@property (readonly) UIButton *fishDisplay;
@property (readonly) UITextView *textView;
@property (readonly) UIImageView *imageView;

@end



@interface DQBrokenLabelViewController (test)

@property (readonly) UILabel *brokenLabel;
@property (readonly) UIButton *dogDisplay;
@property (readonly) UIButton *catDisplay;
@property (readonly) UIButton *fishDisplay;
@property (readonly) UITextView *textView;
@property (readonly) UIImageView *imageView;

@end



@interface IACLabelFixedViewController (test)

@property (readonly) UIButton *dogDisplay;
@property (readonly) UIButton *catDisplay;
@property (readonly) UIButton *fishDisplay;
@property (readonly) UIImageView *imageView;

@end


#endif

//
//  DQBrokenLabelViewController.h
//  iosFireEyesInstructions
//
//  Created by Catherine Fisher on 2/12/14.
//  Copyright (c) 2014 Deque Systems. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IACViewController.h"

@interface IACLabelBrokenViewController : IACViewController 

@property (readonly) UILabel *brokenLabel;
@property (readonly) UIButton *dogDisplay;
@property (readonly) UIButton *catDisplay;
@property (readonly) UIButton *fishDisplay;
@property (readonly) UITextView *textView;
@property (readonly) UIImageView *imageView;

- (void)displayImage:(id)sender;

@end

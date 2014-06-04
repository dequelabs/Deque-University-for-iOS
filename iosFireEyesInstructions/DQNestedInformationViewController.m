//
//  DQNextedInfoViewController.m
//  iosFireEyesInstructions
//
//  Created by Catherine Fisher on 5/22/14.
//  Copyright (c) 2014 Deque Systems. All rights reserved.
//

#import "DQNestedInformationViewController.h"

@interface DQNestedInformationViewController ()

@end

@implementation DQNestedInformationViewController {
    IBOutlet UILabel *_TitleLabel;
    IBOutlet UILabel *_ImportantLabel;
    IBOutlet UILabel *_WhatNested;
    IBOutlet UITextView *_TextView1;
    IBOutlet UITextView *_TextView2;
    IBOutlet UIImageView *_ImageView;
    IBOutlet UIScrollView *_ScrollView;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //ImageView is not an accessibility element on purpose, so we set these to silence warnings.
	[_ImageView setAccessibilityHint:@""];
    [_ImageView setAccessibilityLabel:@""];
    
    [_TextView1 setText:@"When you mark an element an 'Accessibility Element' you're telling VoiceOver that it is an element that requires user interraction.  You cannot place one such element inside another.  If you do, only the outer element will be focusable using VoiceOver.  Below is a very simple code snippet that would create this issue."];
    
    [_TextView2 setText:@"For developers, grouping information in views allows you to conceptually group areas of functionality, and create sleak, easily scalable applications for multiple view types.  Just remember not to make your container views 'Accessibility Elements' and you're all set."];
}

- (BOOL)shouldAutorotate {
    return NO;
}

@end

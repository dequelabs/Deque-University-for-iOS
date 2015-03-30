//
//  DQHintInformationViewController.m
//  iosFireEyesInstructions
//
//  Created by Catherine Fisher on 2/10/14.
//  Copyright (c) 2014 Deque Systems. All rights reserved.
//

#import "DQHintInformationViewController.h"

@interface DQHintInformationViewController ()

@end

@implementation DQHintInformationViewController {
    IBOutlet UILabel *_TitleLabel;
    IBOutlet UILabel *_ImportantLabel;
    IBOutlet UILabel *_WhatHint;
    IBOutlet UITextView *_WhatTextView;
    IBOutlet UITextView *_ImportantTextView;
    IBOutlet UIImageView *_ImageView;
    IBOutlet UIScrollView *_ScrollView;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.screenName = @"Hints Introduction";
}


- (void)viewDidLoad
{
    [super viewDidLoad];

    //ImageView is not an accessibility element on purpose, so we set these to silence warnings.
	[_ImageView setAccessibilityHint:NSLocalizedString(@"BLANK", nil)];
    [_ImageView setAccessibilityLabel:NSLocalizedString(@"BLANK", nil)];
	
    [_WhatTextView setText:NSLocalizedString(@"HINT_INFO_TEXTVIEW1", nil)];
    
    [_WhatTextView setEditable:NO];
    
    [_ImportantTextView setText:NSLocalizedString(@"HINT_INFO_TEXTVIEW2", nil)];
    
    [_ImportantTextView setEditable:NO];
}

- (void)viewDidLayoutSubviews {
    [_ScrollView setContentSize:CGSizeMake(320, 550)];
}

- (BOOL)shouldAutorotate {
    return NO;
}

@end

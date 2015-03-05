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

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //ImageView is not an accessibility element on purpose, so we set these to silence warnings.
	[_ImageView setAccessibilityHint:NSLocalizedString(@"BLANK", nil)];
    [_ImageView setAccessibilityLabel:NSLocalizedString(@"BLANK", nil)];
    
    [_WhatTextView setText:NSLocalizedString(@"NESTED_INFORMATION_TEXTVIEW1", nil)];
    
    [_ImportantTextView setText:NSLocalizedString(@"NESTED_INFORMATION_TEXTVIEW2", nil)];
}

- (BOOL)shouldAutorotate {
    return NO;
}

@end

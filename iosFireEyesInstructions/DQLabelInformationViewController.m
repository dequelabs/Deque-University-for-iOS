//
//  DQLabalInformationViewController.m
//  iosFireEyesInstructions
//
//  Created by Catherine Fisher on 2/10/14.
//  Copyright (c) 2014 Deque Systems. All rights reserved.
//

#import "DQLabelInformationViewController.h"

@interface DQLabelInformationViewController ()

@end

@implementation DQLabelInformationViewController {
    IBOutlet UITextView *_TextView1;
    IBOutlet UITextView *_TextView2;
    IBOutlet UILabel *_WhatLabel;
    IBOutlet UILabel *_ImportantLabel;
    IBOutlet UILabel *_TitleLabel;
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
	[_TextView1 setText:NSLocalizedString(@"LABEL_INFO_TEXTVIEW1", nil)];
    
    [_TextView2 setText:NSLocalizedString(@"LABEL_INFO_TEXTVIEW2", nil)];
    
    [_TextView1 setEditable:NO];
    [_TextView2 setEditable:NO];
}

- (void)viewDidLayoutSubviews {
    [_ScrollView setContentSize:CGSizeMake(320, 650)];
}

- (BOOL)shouldAutorotate {
    return NO;
}

@end

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
	
    [_TextView1 setText:@"Hints identify what an object does.  They provide additional context to users who are not use to using your application.  Hints should start with a capital letter and contain a verb.  Hints should not contain information about the trait, and should avoid duplicating information in the label.  Though, sometimes reiterating the most simple information from the label is helpful."];
    
    [_TextView1 setEditable:NO];
    
    [_TextView2 setText:@"Hints provide the information that new users to your application need to help them know what your application does.  Going back to our power users versus new users example, hints help new users.  Ideally as users become accustomed to your application, the information provided in the hint will not be needed.  However, until they've spent enough time using your app, the information contained in the hint is crucial."];
    
    [_TextView2 setEditable:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotate {
    return NO;
}

@end

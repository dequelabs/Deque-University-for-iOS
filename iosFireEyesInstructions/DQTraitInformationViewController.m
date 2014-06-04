//
//  DQTraitInfoViewController.m
//  iosFireEyesInstructions
//
//  Created by Catherine Fisher on 5/22/14.
//  Copyright (c) 2014 Deque Systems. All rights reserved.
//

#import "DQTraitInformationViewController.h"

@interface DQTraitInformationViewController ()

@end

@implementation DQTraitInformationViewController {
    IBOutlet UILabel *_TitleLabel;
    IBOutlet UITextView *_TextView1;
    IBOutlet UITextView *_TextView2;
    IBOutlet UILabel *_WhatTrait;
    IBOutlet UILabel *_ImportantLabel;
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
    
    [_TextView1 setText:@"Traits help identify what a button does.  Each trait has a very specific purpose.  Some traits, such as button/link communicate purpose to VoiceOver users, while others like 'Updates Frequently' communicate information about the behavior of an item to VoiceOver, to ensure that it behaves reasonably."];
    
    [_TextView2 setText:@"When a sighted user uses an application, they get hints about what UI Elements do based on their appearance.  Traits help communicate this same information to non-sighted users."];
    
    
    //Our Image Views are presentation only
    [_ImageView setAccessibilityHint:@""];
    [_ImageView setAccessibilityLabel:@""];
}

- (BOOL)shouldAutorotate {
    return NO;
}

@end

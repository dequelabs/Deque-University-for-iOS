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
    IBOutlet UITextView *_WhatTextView;
    IBOutlet UITextView *_ImportantTextView;
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

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.screenName = @"Traits Fixed";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [_WhatTextView setText:NSLocalizedString(@"TRAIT_INFO_TEXTVIEW1", nil)];
    
    [_ImportantTextView setText:NSLocalizedString(@"TRAIT_INFO_TEXTVIEW2", nil)];
    
    
    //Our Image Views are presentation only
    [_ImageView setAccessibilityHint:@""];
    [_ImageView setAccessibilityLabel:@""];
}

- (BOOL)shouldAutorotate {
    return NO;
}

@end

//
//  DQLabalInformationViewController.m
//  iosFireEyesInstructions
//
//  Created by Catherine Fisher on 2/10/14.
//  Copyright (c) 2014 Deque Systems. All rights reserved.
//

#import "DQLabalInformationViewController.h"

@interface DQLabalInformationViewController ()

@end

@implementation DQLabalInformationViewController {
    IBOutlet UITextView *_TextView1;
    IBOutlet UITextView *_TextView2;
    IBOutlet UILabel *_WhatLabel;
    IBOutlet UILabel *_ImportantLabel;
    IBOutlet UILabel *_TitleLabel;
    IBOutlet UIImageView *_ImageView;
    IBOutlet UIButton *_BackButton;
    IBOutlet UIButton *_HintButton;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

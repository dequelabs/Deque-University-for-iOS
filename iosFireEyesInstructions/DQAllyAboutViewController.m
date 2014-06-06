//
//  DQAllyAboutViewController.m
//  iosFireEyesInstructions
//
//  Created by Catherine Fisher on 2/10/14.
//  Copyright (c) 2014 Deque Systems. All rights reserved.
//

#import "DQAllyAboutViewController.h"

@interface DQAllyAboutViewController ()

@end

@implementation DQAllyAboutViewController {
    IBOutlet UILabel *_AboutLabel;
    IBOutlet UITextView *_TextView;
    IBOutlet UIButton *_LabelsButton;
    IBOutlet UIButton *_HintsButton;
    IBOutlet UIButton *_TraitsButton;
    IBOutlet UIButton *_NestedButton;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [_TextView setText:NSLocalizedString(@"A11Y_ABOUT_TEXTVIEW", nil)];
    
    [_TextView setEditable:NO];
}

- (BOOL)shouldAutorotate {
    return NO;
}

@end

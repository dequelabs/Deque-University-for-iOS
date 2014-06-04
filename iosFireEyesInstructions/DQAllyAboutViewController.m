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
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [_LabelsButton setAccessibilityLabel:[[_LabelsButton titleLabel] text]];
    [_LabelsButton setAccessibilityHint:@"Open help content"];
    
    [_HintsButton setAccessibilityLabel:[[_HintsButton titleLabel] text]];
    [_HintsButton setAccessibilityHint:@"Open help content"];
    
    [_TraitsButton setAccessibilityLabel:[[_TraitsButton titleLabel] text]];
    [_TraitsButton setAccessibilityHint:@"Open help content"];

    [_NestedButton setAccessibilityLabel:[[_NestedButton titleLabel] text]];
    [_NestedButton setAccessibilityHint:@"Open help content"];
	
    _TextView.text = @"When a user interracts with an application, certain aspects of the application are immediately apparent.  Visual clues, other apps you've dealt with in the past, UI conventions and so forth all help a user understand what it is an application does.  Accessibility is about portraying this same information, but to users with different capabilities.  This application aims to provide scenarios and descriptions in a way that helps you to understand the difficulties users with dissabilities have with interracting with iOS applications,  as well as the techniques and conventions you can use to portray this information, using basic iOS APIs.";
    
    [_TextView setEditable:NO];
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

//
//  DQNestedFixedViewController.m
//  iosFireEyesInstructions
//
//  Created by Catherine Fisher on 5/22/14.
//  Copyright (c) 2014 Deque Systems. All rights reserved.
//

#import "DQFixedNestedViewController.h"

@interface DQFixedNestedViewController ()

@end

@implementation DQFixedNestedViewController {
    IBOutlet UILabel *_BrokenFixedLabel;
    IBOutlet UILabel *_SSBLabel;
    IBOutlet UILabel *_AGLabel;
    IBOutlet UILabel *_SITRLabel;
    IBOutlet UILabel *_ExampleLabel;
    IBOutlet UIButton *_SSBDisplay;
    IBOutlet UIButton *_AGDisplay;
    IBOutlet UIButton *_SITRDisplay;
    IBOutlet UITextView *_TextView;
    IBOutlet UILabel *_MusicPlayer;
    IBOutlet UIView *_View;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [_TextView setText:NSLocalizedString(@"NESTED_FIXED_TEXTVIEW", nil)];
}

- (BOOL)shouldAutorotate {
    return NO;
}

@end

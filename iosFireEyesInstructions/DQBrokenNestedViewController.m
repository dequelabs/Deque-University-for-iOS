//
//  DQNestedBrokenViewController.m
//  iosFireEyesInstructions
//
//  Created by Catherine Fisher on 5/22/14.
//  Copyright (c) 2014 Deque Systems. All rights reserved.
//

#import "DQBrokenNestedViewController.h"

@interface DQBrokenNestedViewController ()

@end

@implementation DQBrokenNestedViewController {
    IBOutlet UILabel *_BrokenFixedLabel;
    IBOutlet UILabel *_SSBLabel;
    IBOutlet UILabel *_AGLabel;
    IBOutlet UILabel *_SITRLabel;
    IBOutlet UIButton *_SSBDisplay;
    IBOutlet UIButton *_AGDisplay;
    IBOutlet UIButton *_SITRDisplay;
    IBOutlet UITextView *_TextView;
    IBOutlet UILabel *_MusicPlayer;
    IBOutlet UIView *_View;
    IBOutlet UILabel *_ExampleLabel;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [_TextView setText:@"Notice how, when you turn VoiceOver on, a black box shows up around our music player.  You cannot interract with the button elements inside this box!"];
}

- (BOOL)shouldAutorotate {
    return NO;
}

@end

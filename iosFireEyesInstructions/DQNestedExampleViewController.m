//
//  DQNestedExampleViewController.m
//  iosFireEyesInstructions
//
//  Created by Catherine Fisher on 5/22/14.
//  Copyright (c) 2014 Deque Systems. All rights reserved.
//

#import "DQNestedExampleViewController.h"

@interface DQNestedExampleViewController ()

@end

@implementation DQNestedExampleViewController {
    IBOutlet UILabel *_ExampleLabel;
    IBOutlet UILabel *_SSBLabel;
    IBOutlet UILabel *_AGLabel;
    IBOutlet UILabel *_SITRLabel;
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
    [_TextView setText:@"Remember our music player?  In this view we have added a parent view around our entire player.  This is a very reasonable separation of functionality"];
}

- (BOOL)shouldAutorotate {
    return NO;
}

@end

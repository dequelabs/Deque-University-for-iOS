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
    IBOutlet UILabel *_StarSpangledBannerLabel;
    IBOutlet UILabel *_AmazingGraceLabel;
    IBOutlet UILabel *_SingingInTheRainLabel;
    IBOutlet UIButton *_StarSpangledBannerPlay;
    IBOutlet UIButton *_AmazingGracePlay;
    IBOutlet UIButton *_SingingInTheRainPlay;
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
    [_TextView setText:NSLocalizedString(@"NESTED_EXAMPLE_TEXTVIEW", nil)];
}

- (BOOL)shouldAutorotate {
    return NO;
}

@end

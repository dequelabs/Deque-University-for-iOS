//
//  DQBrokenHintViewController.m
//  iosFireEyesInstructions
//
//  Created by Catherine Fisher on 2/12/14.
//  Copyright (c) 2014 Deque Systems. All rights reserved.
//

#import "DQBrokenHintViewController.h"

@interface DQBrokenHintViewController ()

@end

@implementation DQBrokenHintViewController {
    IBOutlet UILabel *_BrokenFixedLabel;
    __weak IBOutlet UIButton *_SSBDisplay;
    IBOutlet UIButton *_AGDisplay;
    IBOutlet UIButton *_SITRDisplay;
    IBOutlet UITextView *_TextView;
    IBOutlet UILabel *_SSBLabel;
    IBOutlet UILabel *_AGLabel;
    IBOutlet UILabel *_SITRLabel;
    IBOutlet UILabel *_MusicPlayer;
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
    [_TextView setText:@"Now, without those visual cues, what do these buttons do?  Sure, the accessibility labels of song titles suggest that songs will be played.  But, iOS provides the Hint attribute for us so we can tell users: \"This button plays a song\""];
    
    
    [_SSBDisplay setAccessibilityLabel:@"Star Spangled Banner"];
    [_SSBDisplay addTarget:self action:@selector(visitWebPage:) forControlEvents:UIControlEventTouchDown];
    //[_SSBDisplay setAccessibilityHint:@"Visit wiki article"];
    
    [_AGDisplay setAccessibilityLabel:@"Amazing Grace"];
    [_AGDisplay addTarget:self action:@selector(visitWebPage:) forControlEvents:UIControlEventTouchDown];
    //[_AGDisplay setAccessibilityHint:@"Visit wiki article"];
    
    [_SITRDisplay setAccessibilityLabel:@"Singing in the Rain"];
    [_SITRDisplay addTarget:self action:@selector(visitWebPage:) forControlEvents:UIControlEventTouchDown];
    //[_SITRDisplay setAccessibilityHint:@"Visit wiki article"];
    
    [_SSBLabel setIsAccessibilityElement:false];
    
    [_AGLabel setIsAccessibilityElement:false];
    
    [_SITRLabel setIsAccessibilityElement:false];
    
    [_TextView setEditable:NO];
    
}

- (void)visitWebPage:(id)sender {
    
    NSString* url = nil;
    if (sender == _SSBDisplay) {
        url = @"http://en.wikipedia.org/wiki/The_Star-Spangled_Banner";
    } else if (sender == _AGDisplay) {
        url = @"http://en.wikipedia.org/wiki/Amazing_Grace";
    } else {
        url = @"http://en.wikipedia.org/wiki/Singin'_in_the_Rain";
    }
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
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

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
    IBOutlet UILabel *_BrokenLabel;
    __weak IBOutlet UILabel *_StarSpangledBannerLabel;
    IBOutlet UILabel *_AmazingGraceLabel;
    IBOutlet UILabel *_SingingInTheRainLabel;
    IBOutlet UIButton *_StarSpangledBannerPlay;
    IBOutlet UIButton *_AmazingGracePlay;
    IBOutlet UIButton *_SingingInTheRainPlay;
    IBOutlet UITextView *_TextView;
    IBOutlet UILabel *_MusicPlayer;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.screenName = @"Hints Broken";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [_TextView setText:@"Now, without those visual cues, what do these buttons do?  Sure, the accessibility labels of song titles suggest that songs will be played.  But, iOS provides the Hint attribute for us so we can tell users: \"This button plays a song\""];
    
    
    [_StarSpangledBannerPlay setAccessibilityLabel:@"Star Spangled Banner"];
    [_StarSpangledBannerPlay addTarget:self action:@selector(visitWebPage:) forControlEvents:UIControlEventTouchDown];
    //[_SSBDisplay setAccessibilityHint:@"Visit wiki article"];
    
    [_AmazingGracePlay setAccessibilityLabel:@"Amazing Grace"];
    [_AmazingGracePlay addTarget:self action:@selector(visitWebPage:) forControlEvents:UIControlEventTouchDown];
    //[_AGDisplay setAccessibilityHint:@"Visit wiki article"];
    
    [_SingingInTheRainPlay setAccessibilityLabel:@"Singing in the Rain"];
    [_SingingInTheRainPlay addTarget:self action:@selector(visitWebPage:) forControlEvents:UIControlEventTouchDown];
    //[_SITRDisplay setAccessibilityHint:@"Visit wiki article"];
    
    [_StarSpangledBannerLabel setIsAccessibilityElement:false];
    
    [_AmazingGraceLabel setIsAccessibilityElement:false];
    
    [_SingingInTheRainLabel setIsAccessibilityElement:false];
    
    [_TextView setEditable:NO];
    
}

- (void)visitWebPage:(id)sender {
    
    NSString* url = nil;
    if (sender == _StarSpangledBannerPlay) {
        url = @"http://en.wikipedia.org/wiki/The_Star-Spangled_Banner";
    } else if (sender == _AmazingGracePlay) {
        url = @"http://en.wikipedia.org/wiki/Amazing_Grace";
    } else {
        url = @"http://en.wikipedia.org/wiki/Singin'_in_the_Rain";
    }
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
}

- (BOOL)shouldAutorotate {
    return NO;
}

@end

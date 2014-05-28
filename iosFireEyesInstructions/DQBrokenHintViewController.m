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
    __weak IBOutlet UIButton *_DogDisplay;
    IBOutlet UIButton *_CatDisplay;
    IBOutlet UIButton *_FishDisplay;
    IBOutlet UITextView *_TextView;
    IBOutlet UILabel *_SSB;
    IBOutlet UILabel *_AG;
    IBOutlet UILabel *_SITR;
    IBOutlet UILabel *_MusicLabel;
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
    
    
    [_DogDisplay setAccessibilityLabel:@"Star Spangled Banner"];
    [_DogDisplay addTarget:self action:@selector(visitWebPage:) forControlEvents:UIControlEventTouchDown];
    //[_DogDisplay setAccessibilityHint:@"Visit wiki article"];
    
    [_CatDisplay setAccessibilityLabel:@"Amazing Grace"];
    [_CatDisplay addTarget:self action:@selector(visitWebPage:) forControlEvents:UIControlEventTouchDown];
    //[_CatDisplay setAccessibilityHint:@"Visit wiki article"];
    
    [_FishDisplay setAccessibilityLabel:@"Singing in the Rain"];
    [_FishDisplay addTarget:self action:@selector(visitWebPage:) forControlEvents:UIControlEventTouchDown];
    //[_FishDisplay setAccessibilityHint:@"Visit wiki article"];
    
    [_SSB setIsAccessibilityElement:false];
    
    [_AG setIsAccessibilityElement:false];
    
    [_SITR setIsAccessibilityElement:false];
    
    [_TextView setEditable:NO];
    
}

- (void)visitWebPage:(id)sender {
    
    NSString* url = nil;
    if (sender == _DogDisplay) {
        url = @"http://en.wikipedia.org/wiki/The_Star-Spangled_Banner";
    } else if (sender == _CatDisplay) {
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

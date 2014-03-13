//
//  DQFixedHintViewController.m
//  iosFireEyesInstructions
//
//  Created by Catherine Fisher on 2/12/14.
//  Copyright (c) 2014 Deque Systems. All rights reserved.
//

#import "DQFixedHintViewController.h"
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

@interface DQFixedHintViewController ()

@end

@implementation DQFixedHintViewController {
    IBOutlet UILabel *_BrokenFixedLabel;
    IBOutlet UIButton *_DogDisplay;
    IBOutlet UIButton *_CatDisplay;
    IBOutlet UIButton *_FishDisplay;
    IBOutlet UITextView *_TextView;
    IBOutlet UILabel *_SSB;
    IBOutlet UILabel *_SITR;
    IBOutlet UILabel *_AG;
    
    AVAudioPlayer* _AudioPlayer;
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
    
    [_TextView setEditable:NO];
    [_TextView setText:@"Now we have added the hint information back onto the buttons.  With these hints, you know that 'Star Spangled Banner' is a song that is going to be played, and not a website that will be visited for further information."];
    
    [_DogDisplay setAccessibilityLabel:@"Star Spangled Banner"];
    [_DogDisplay setAccessibilityHint:@"Plays Song"];
    [_DogDisplay addTarget:self action:@selector(playMusic:) forControlEvents:UIControlEventTouchDown];
    
    [_CatDisplay setAccessibilityLabel:@"Amazing Grace"];
    [_CatDisplay setAccessibilityHint:@"Plays Song"];
    [_CatDisplay addTarget:self action:@selector(playMusic:) forControlEvents:UIControlEventTouchDown];

    
    [_FishDisplay setAccessibilityLabel:@"Singing in the Rain"];
    [_FishDisplay setAccessibilityHint:@"Plays Song"];
    [_FishDisplay addTarget:self action:@selector(playMusic:) forControlEvents:UIControlEventTouchDown];

    [_SSB setIsAccessibilityElement:false];
    
    [_AG setIsAccessibilityElement:false];
    
    [_SITR setIsAccessibilityElement:false];
    
}

- (void)playMusic:(id)sender {
    
    if ([_AudioPlayer isPlaying]) [_AudioPlayer stop];
    
    UIButton* button = (UIButton*)sender;
    NSString* song = nil;
    
    if (button == _DogDisplay) {
        song = @"SSB";
    } else if (button == _CatDisplay) {
        song = @"AG";
    } else {
        song = @"SIR";
    }
    
    NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:song ofType:@"mp3"];
    NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];
    NSError* error;
    _AudioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL error:&error];
    
    if (error) NSLog(@"Error: %@", error);
    
    _AudioPlayer.numberOfLoops = 0;
    _AudioPlayer.volume = 1000;
    
    [_AudioPlayer performSelector:@selector(stop) withObject:_AudioPlayer afterDelay:5];
    
    if ([_AudioPlayer play]) NSLog(@"Shoudl be playing");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

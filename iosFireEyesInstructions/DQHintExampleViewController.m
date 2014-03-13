//
//  DQHintExampleViewController.m
//  iosFireEyesInstructions
//
//  Created by Catherine Fisher on 2/12/14.
//  Copyright (c) 2014 Deque Systems. All rights reserved.
//

#import "DQHintExampleViewController.h"
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

@interface DQHintExampleViewController ()

@end

@implementation DQHintExampleViewController {
    IBOutlet UILabel *_ExampleLabel;
    IBOutlet UILabel *_DogLabel;
    IBOutlet UILabel *_CatLabel;
    IBOutlet UILabel *_FishLabel;
    IBOutlet UIButton *_DogDisplay;
    IBOutlet UIButton *_CatDisplay;
    IBOutlet UIButton *_FishDisplay;
    IBOutlet UITextView *_TextView;
    
    AVAudioPlayer* _AudioPlayer;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    return [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
}

- (void)viewDidLoad {

    [super viewDidLoad];

    [_TextView setEditable:NO];
    [_TextView setText:@"Notice how the visual cues, like the title \"Music Player\" and the style of the \"Play Buttons\" provide context.  Because of these visual cues we already know what these buttons do."];
    
    [_FishDisplay setAccessibilityLabel:@"Singing in the Rain"];
    [_CatDisplay setAccessibilityLabel:@"Amazing Grace"];
    [_DogDisplay setAccessibilityLabel:@"Star Spangled Banner"];
    
    [_FishDisplay setAccessibilityHint:@"Plays Music"];
    [_DogDisplay setAccessibilityHint:@"Plays Music"];
    [_CatDisplay setAccessibilityHint:@"Plays Music"];
    
    [_DogLabel setIsAccessibilityElement:NO];
    [_CatLabel setIsAccessibilityElement:NO];
    [_FishLabel setIsAccessibilityElement:NO];
    
    
    [_FishDisplay addTarget:self action:@selector(playMusic:) forControlEvents:UIControlEventTouchDown];
    [_CatDisplay addTarget:self action:@selector(playMusic:) forControlEvents:UIControlEventTouchDown];
    [_DogDisplay addTarget:self action:@selector(playMusic:) forControlEvents:UIControlEventTouchDown];
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

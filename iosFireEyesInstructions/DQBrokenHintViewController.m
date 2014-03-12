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
    IBOutlet UIButton *_DogDisplay;
    IBOutlet UIButton *_CatDisplay;
    IBOutlet UIButton *_FishDisplay;
    IBOutlet UITextView *_TextView;
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
    
    [_CatDisplay setAccessibilityLabel:@"Amazing Grace"];
    
    [_FishDisplay setAccessibilityLabel:@"Singing in the Rain"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

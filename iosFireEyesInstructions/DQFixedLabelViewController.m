//
//  DQFixedLabelViewController.m
//  iosFireEyesInstructions
//
//  Created by Catherine Fisher on 2/12/14.
//  Copyright (c) 2014 Deque Systems. All rights reserved.
//

#import "DQFixedLabelViewController.h"

@interface DQFixedLabelViewController ()

@end

@implementation DQFixedLabelViewController {
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
    
    [_TextView setText:@"Here we have added the relevant accessibility information.  Now, with voiceover turned on, you can easily tell which picture is going to be displayed."];
    
    [_CatDisplay setAccessibilityLabel:@"Cat"];
    [_DogDisplay setAccessibilityLabel:@"Dog"];
    [_FishDisplay setAccessibilityLabel:@"Fish"];
    
    [_CatDisplay addTarget:self action:@selector(displayAlert:) forControlEvents:UIControlEventTouchDown];
    [_DogDisplay addTarget:self action:@selector(displayAlert:) forControlEvents:UIControlEventTouchDown];
    [_FishDisplay addTarget:self action:@selector(displayAlert:) forControlEvents:UIControlEventTouchDown];
}

- (void)displayAlert:(id)sender {
    UIButton* button = (UIButton*)sender;
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Picture"
                                                    message:[button accessibilityLabel]
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

- (void)displayDog:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Picture"
                                                    message:@"A dog"
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

- (void)displayFish:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Picture"
                                                    message:@"A fish"
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

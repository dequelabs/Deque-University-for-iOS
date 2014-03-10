//
//  DQBrokenLabelViewController.m
//  iosFireEyesInstructions
//
//  Created by Catherine Fisher on 2/12/14.
//  Copyright (c) 2014 Deque Systems. All rights reserved.
//

#import "DQBrokenLabelViewController.h"

@interface DQBrokenLabelViewController ()

@end

@implementation DQBrokenLabelViewController {
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
	
    [_TextView setText:@"This is the way a blind person percieves this particular view.  Notice the ambiguity of the diplay buttons.  What pictures do they display?"];
    
    [_CatDisplay addTarget:self action:@selector(displayCat:) forControlEvents:UIControlEventTouchDown];
    [_DogDisplay addTarget:self action:@selector(displayDog:) forControlEvents:UIControlEventTouchDown];
    [_FishDisplay addTarget:self action:@selector(displayFish:) forControlEvents:UIControlEventTouchDown];
}

- (void)displayCat:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Picture"
                                                    message:@"Cat"
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

- (void)displayDog:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Picture"
                                                    message:@"Dog"
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

- (void)displayFish:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Picture"
                                                    message:@"Fish"
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

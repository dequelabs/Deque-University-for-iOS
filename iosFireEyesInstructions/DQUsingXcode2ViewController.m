//
//  DQUsingXcode2ViewController.m
//  iosFireEyesInstructions
//
//  Created by Catherine Fisher on 4/2/14.
//  Copyright (c) 2014 Deque Systems. All rights reserved.
//

#import "DQUsingXcode2ViewController.h"

@interface DQUsingXcode2ViewController ()

@end

@implementation DQUsingXcode2ViewController {
    IBOutlet UITextView *_step5;
    IBOutlet UITextView *_step6;
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

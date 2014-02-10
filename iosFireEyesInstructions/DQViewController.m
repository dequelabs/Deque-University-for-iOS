//
//  DQViewController.m
//  iosFireEyesInstructions
//
//  Created by Catherine Fisher on 2/5/14.
//  Copyright (c) 2014 Deque Systems. All rights reserved.
//

#import "DQViewController.h"

@interface DQViewController ()

@end

@implementation DQViewController {
    IBOutlet UIButton *_AllyButton;
    IBOutlet UIButton *_AnalyzerButton;
    IBOutlet UIButton *_HowButton;
    IBOutlet UIImageView *_LogoImage;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        NSLog(@"Hi there: %@", self);
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

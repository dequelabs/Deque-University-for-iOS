//
//  DQAllyAboutViewController.m
//  iosFireEyesInstructions
//
//  Created by Catherine Fisher on 2/10/14.
//  Copyright (c) 2014 Deque Systems. All rights reserved.
//

#import "DQAllyAboutViewController.h"

@interface DQAllyAboutViewController ()

@end

@implementation DQAllyAboutViewController {
    IBOutlet UILabel *_AboutLabel;
    IBOutlet UIButton *_MenuButton;
    IBOutlet UIButton *_LabelsButton;
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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

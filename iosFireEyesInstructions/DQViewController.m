//
//  DQViewController.m
//  iosFireEyesInstructions
//
//  Created by Catherine Fisher on 2/5/14.
//  Copyright (c) 2014 Deque Systems. All rights reserved.
//

#import "DQViewController.h"

@interface DQViewController () {
    UIButton* blah;
}

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
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[_LogoImage setImage:[UIImage imageNamed:@"DequeLogo"]];
}

- (BOOL)shouldAutorotate {
    return NO;
}

@end

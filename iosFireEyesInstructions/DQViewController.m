//
//  DQViewController.m
//  iosFireEyesInstructions
//
//  Created by Catherine Fisher on 2/5/14.
//  Copyright (c) 2014 Deque Systems. All rights reserved.
//

#import "DQViewController.h"

@implementation DQViewController {
    __weak IBOutlet UIButton *_AllyButton;
    __weak IBOutlet UIButton *_TourButton;
    __weak IBOutlet UITextView *_InfoText;
    __weak IBOutlet UIImageView *_LogoImage;
    __weak IBOutlet UIButton *_AboutDequeButton;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.screenName = @"Home";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[_LogoImage setImage:[UIImage imageNamed:@"DequeLogo"]];
    
    [_InfoText setText:NSLocalizedString(@"INTRO_ABOUT_APP", nil)];
    
    [_AboutDequeButton addTarget:self action:@selector(openDequeWebsite) forControlEvents:UIControlEventTouchUpInside];
    
    NSMutableAttributedString *titleString = [[NSMutableAttributedString alloc] initWithString:_AboutDequeButton.titleLabel.text];
    
    [titleString addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(0, [titleString length])];
    
    [_AboutDequeButton setAttributedTitle:titleString forState:UIControlStateNormal];
}

- (void)openDequeWebsite {
    NSLog(@"Attempt to load website");
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://accessibility.deque.com/contact-deque-today"]];
}

- (BOOL)shouldAutorotate {
    return NO;
}

@end

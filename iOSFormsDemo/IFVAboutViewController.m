//
//  IFVAboutViewController.m
//  FormValidation
//
//  Created by Chris McMeeking on 4/13/15.
//  Copyright (c) 2015 Deque Developer. All rights reserved.
//

#import "IFVAboutViewController.h"

@implementation IFVAboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.learnAboutVoiceOver.underlined = YES;
    
    [self.learnAboutVoiceOver addTarget:self action:@selector(learnAboutVoiceOverAction) forControlEvents:UIControlEventTouchUpInside];
}

- (void)learnAboutVoiceOverAction {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.apple.com/accessibility/ios/voiceover/"]];
}

@end

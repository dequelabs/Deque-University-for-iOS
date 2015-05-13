//
//  IACAboutDequeViewController.m
//  Accessibility 101
//
//  Created by Chris McMeeking on 4/16/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import "IACAboutDequeViewController.h"
#import "DQButton.h"

#define DEQUE_URL @"http://accessibility.deque.com/contact-deque-today"

@interface IACAboutDequeViewController ()
@property (weak, nonatomic) IBOutlet DQButton *buttonContactUs;
@end

@implementation IACAboutDequeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.buttonContactUs addTarget:self action:@selector(loadDequeWebPage) forControlEvents:UIControlEventTouchUpInside];
    
    self.buttonContactUs.underlined = YES;
}

- (void)loadDequeWebPage {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:DEQUE_URL]];
}

@end

//
//  IACUpdatingContentFixedViewController.m
//  Deque University for iOS
//
//  Created by Jennifer Dailey on 6/22/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import "IACUpdatingContentFixedViewController.h"
#import <DQA11y/DQA11y.h>

@interface IACUpdatingContentFixedViewController ()

@property (nonatomic, strong) NSTimer *myTimer;
@property (nonatomic, strong) IBOutlet DQLabel *progressLabel;
@property (strong, nonatomic) UIProgressView *progressView;
@property (weak, nonatomic) IBOutlet UIView *wrapperView;
@property (weak, nonatomic) IBOutlet DQButton *buttonToChangeProgress;

@end

@implementation IACUpdatingContentFixedViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
    
    [self.wrapperView addSubview:self.progressView];
    
    self.myTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateUI:) userInfo:nil repeats:YES];
    [self.buttonToChangeProgress addTarget:self action:@selector(changeProgress) forControlEvents:UIControlEventTouchDown];
    [self.buttonToChangeProgress setAccessibilityHint:@"Pauses the Ten Second Alerts."];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.myTimer invalidate];
    [self.buttonToChangeProgress setTitle:@"Stop" forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)changeProgress {
    if([self.buttonToChangeProgress.titleLabel.text isEqualToString:@"Stop"]) {
        [self.myTimer invalidate];
        [self.buttonToChangeProgress setTitle:@"Start" forState:UIControlStateNormal];
        [self.buttonToChangeProgress setAccessibilityHint:@"Starts the Ten Second Alerts."];
    } else {
        self.myTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateUI:) userInfo:nil repeats:YES];
        [self.buttonToChangeProgress setTitle:@"Stop" forState:UIControlStateNormal];
        [self.buttonToChangeProgress setAccessibilityHint:@"Pauses the Ten Second Alerts."];
    }
}

- (void)updateUI:(NSTimer *)timer {
    static int count = 0; count++;
    
    if (count <= 10) {
        self.progressLabel.text = [NSString stringWithFormat:@"%d seconds",count];
        self.progressView.progress = (float)count/10.0f;
    } else {
        count = 0;
        UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, self.progressView);
        UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, @"Ten Second Alert!");
    }
}

@end

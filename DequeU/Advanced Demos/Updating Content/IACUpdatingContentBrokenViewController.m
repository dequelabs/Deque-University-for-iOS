//
//  IACUpdatingContentBrokenViewController.m
//  Deque University for iOS
//
//  Created by Jennifer Dailey on 6/22/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import "IACUpdatingContentBrokenViewController.h"
#import <DQA11y/DQA11y.h>

@interface IACUpdatingContentBrokenViewController ()

@property (nonatomic, strong) NSTimer *myTimer;
@property (nonatomic, strong) IBOutlet DQLabel *progressLabel;
@property (strong, nonatomic) UIProgressView *progressView;
@property (weak, nonatomic) IBOutlet UIView *demoView;

@end

@implementation IACUpdatingContentBrokenViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
    
    self.progressView.center = self.demoView.center;
    
    [self.demoView addSubview:self.progressView];
    
    self.myTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateUI:) userInfo:nil repeats:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.myTimer invalidate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

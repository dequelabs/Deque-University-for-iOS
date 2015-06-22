//
//  IACUpdatingContentBrokenViewController.m
//  Deque University for iOS
//
//  Created by Jennifer Dailey on 6/22/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import "IACUpdatingContentBrokenViewController.h"

@interface IACUpdatingContentBrokenViewController ()
@property (weak, nonatomic) IBOutlet UILabel *clock;

@end

@implementation IACUpdatingContentBrokenViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self updateClockLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateClockLabel {
    NSDateFormatter* clockFormat = [[NSDateFormatter alloc] init];
    [clockFormat setDateFormat:@"hh:mm:ss a"];
    
    self.clock.text = [clockFormat stringFromDate:[NSDate date]];
    
    [self performSelector:@selector(updateClockLabel) withObject:self afterDelay:1.0];
}

@end

//
//  IACUpdatingContentFixedViewController.m
//  Deque University for iOS
//
//  Created by Jennifer Dailey on 6/22/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import "IACUpdatingContentFixedViewController.h"

@interface IACUpdatingContentFixedViewController ()
@property (weak, nonatomic) IBOutlet UILabel *clockLabel;

@end

@implementation IACUpdatingContentFixedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self updateClockLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateClockLabel {
    
    //format for clock
    NSDateFormatter* clockFormat = [[NSDateFormatter alloc] init];
    [clockFormat setDateFormat:@"hh:mm:ss a"];
    
    self.clockLabel.text = [clockFormat stringFromDate:[NSDate date]];
    
    //format for accessibility label
    NSDateFormatter* accessibilityLabelFormat = [[NSDateFormatter alloc] init];
    [accessibilityLabelFormat setDateFormat:@"hh:mm a"];
    
    self.clockLabel.accessibilityLabel = [accessibilityLabelFormat stringFromDate:[NSDate date]];
    
    [self performSelector:@selector(updateClockLabel) withObject:self afterDelay:1.0];
}

@end

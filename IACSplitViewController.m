//
//  IACSplitViewController.m
//  Accessibility 101
//
//  Created by Chris McMeeking on 4/14/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import "IACSplitViewController.h"

@interface IACSplitViewController ()<UISplitViewControllerDelegate>

@end

@implementation IACSplitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //[self setPreferredDisplayMode:UISplitViewControllerDisplayModePrimaryOverlay];
    [self setPreferredDisplayMode:UISplitViewControllerDisplayModeAllVisible];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

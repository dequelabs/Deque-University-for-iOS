//
//  DQBrokenHintViewController.m
//  Deque University for iOS
//
//  Created by Catherine Fisher on 2/12/14.
//  Copyright (c) 2014 Deque Systems. All rights reserved.
//

#import "IACHintBrokenViewController.h"

@interface IACHintBrokenViewController ()

@end

@implementation IACHintBrokenViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [_buttonStarSpangledBanner setAccessibilityLabel:@"Star Spangled Banner"];
    [_buttonStarSpangledBanner addTarget:self action:@selector(visitWebPage:) forControlEvents:UIControlEventTouchDown];
    //[_SSBDisplay setAccessibilityHint:@"Visit wiki article"];
    
    [_buttonAmazingGrace setAccessibilityLabel:@"Amazing Grace"];
    [_buttonAmazingGrace addTarget:self action:@selector(visitWebPage:) forControlEvents:UIControlEventTouchDown];
    //[_AGDisplay setAccessibilityHint:@"Visit wiki article"];
    
    [_buttonSinginInTheRain setAccessibilityLabel:@"Singing in the Rain"];
    [_buttonSinginInTheRain addTarget:self action:@selector(visitWebPage:) forControlEvents:UIControlEventTouchDown];
    //[_SITRDisplay setAccessibilityHint:@"Visit wiki article"];

}

/**
 * visitWebPage opens the corresponding Wikipedia web page in safari when a button is clicked.
 */

- (NSString*)visitWebPage:(id)sender {
    
    NSString* url = nil;
    if (sender == _buttonStarSpangledBanner) {
        url = @"http://en.wikipedia.org/wiki/The_Star-Spangled_Banner";
    } else if (sender == _buttonAmazingGrace) {
        url = @"http://en.wikipedia.org/wiki/Amazing_Grace";
    } else {
        url = @"http://en.wikipedia.org/wiki/Singin'_in_the_Rain";
    }
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
    return url;
}

- (BOOL)shouldAutorotate {
    return NO;
}

@end

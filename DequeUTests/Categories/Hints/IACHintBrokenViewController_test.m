//
//  IACHintBrokenViewController_test.m
//  Deque University for iOS
//
//  Created by Jennifer Dailey on 5/6/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "IACHintBrokenViewController.h"
#import "DEQAsserts.h"

@interface IACHintBrokenViewController_test : XCTestCase

@property (strong, nonatomic) IACHintBrokenViewController* viewController;

@end


@implementation IACHintBrokenViewController_test

- (void)setUp {
    [super setUp];
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Storyboard" bundle:nil];
    self.viewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"brokenHint"];
    XCTAssert([self.viewController view]);
}

//Tests that each button has correct label and no hint
- (void)testInitialSetUp {
    DEQAssertStringEqual(self.viewController.buttonStarSpangledBanner.accessibilityLabel, @"Star Spangled Banner");
    DEQAssertEmptyString(self.viewController.buttonStarSpangledBanner.accessibilityHint);
    DEQAssertStringEqual(self.viewController.buttonAmazingGrace.accessibilityLabel, @"Amazing Grace");
    DEQAssertEmptyString(self.viewController.buttonAmazingGrace.accessibilityHint);
    DEQAssertStringEqual(self.viewController.buttonSinginInTheRain.accessibilityLabel, @"Singing in the Rain");
    DEQAssertEmptyString(self.viewController.buttonSinginInTheRain.accessibilityHint);
}

//Tests that _buttonStarSpangledBanner has correct label, no hint, and opens up the correct webpage on press
- (void)testButtonStarSpangledBannerOnPress {
    DEQAssertStringEqual([self.viewController visitWebPage:self.viewController.buttonStarSpangledBanner], @"http://en.wikipedia.org/wiki/The_Star-Spangled_Banner");
    DEQAssertStringEqual(self.viewController.buttonStarSpangledBanner.accessibilityLabel, @"Star Spangled Banner");
    DEQAssertEmptyString(self.viewController.buttonStarSpangledBanner.accessibilityHint);
}

//Tests that _buttonAmazingGrace has correct label, no hint, and opens up the correct webpage on press
- (void)testButtonAmazingGraceOnPress {
    DEQAssertStringEqual([self.viewController visitWebPage:self.viewController.buttonAmazingGrace], @"http://en.wikipedia.org/wiki/Amazing_Grace");
    DEQAssertStringEqual(self.viewController.buttonAmazingGrace.accessibilityLabel, @"Amazing Grace");
    DEQAssertEmptyString(self.viewController.buttonAmazingGrace.accessibilityHint);
}

//Tests that _buttonSinginInTheRain has correct label, no hint, and opens up the correct webpage on press
- (void)testButtonSingingInTheRainOnPress {
    DEQAssertStringEqual([self.viewController visitWebPage:self.viewController.buttonSinginInTheRain], @"http://en.wikipedia.org/wiki/Singin'_in_the_Rain");
    DEQAssertStringEqual(self.viewController.buttonSinginInTheRain.accessibilityLabel, @"Singing in the Rain");
    DEQAssertEmptyString(self.viewController.buttonSinginInTheRain.accessibilityHint);
}

@end

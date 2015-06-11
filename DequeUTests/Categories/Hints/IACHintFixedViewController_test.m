//
//  IACHintFixedViewController_test.m
//  Deque University for iOS
//
//  Created by Jennifer Dailey on 5/12/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "IACHintFixedViewController.h"
#import "DEQAsserts.h"

@interface IACHintFixedViewController_test : XCTestCase

@property (strong, nonatomic) IACHintFixedViewController* viewController;

@end


@implementation IACHintFixedViewController_test

- (void)setUp {
    [super setUp];
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Storyboard" bundle:nil];
    self.viewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"fixedHint"];
    XCTAssert([self.viewController view]);
}

//Tests that each button has correct label and no hint
- (void)testInitialSetUp {
    DEQAssertStringEqual(self.viewController.buttonStarSpangledBanner.accessibilityHint, NSLocalizedString(@"PLAYS_MUSIC", nil));
    DEQAssertStringEqual(self.viewController.buttonAmazingGrace.accessibilityHint, NSLocalizedString(@"PLAYS_MUSIC", nil));
    DEQAssertStringEqual(self.viewController.buttonSinginInTheRain.accessibilityHint, NSLocalizedString(@"PLAYS_MUSIC", nil));
}

//Tests that _buttonStarSpangledBanner has correct label, no hint, and that _AudioPlayer plays correctly
- (void)testButtonStarSpangledBannerOnPress {
    DEQAssertStringEqual([self.viewController playMusic:self.viewController.buttonStarSpangledBanner], @"SSB");;
    DEQAssertStringEqual(self.viewController.buttonStarSpangledBanner.accessibilityHint, NSLocalizedString(@"PLAYS_MUSIC", nil));
}

//Tests that _buttonAmazingGrace has correct label, no hint, and opens up the correct webpage on press
- (void)testButtonAmazingGraceOnPress {
    DEQAssertStringEqual([self.viewController playMusic:self.viewController.buttonAmazingGrace], @"AG");
    DEQAssertStringEqual(self.viewController.buttonStarSpangledBanner.accessibilityHint, NSLocalizedString(@"PLAYS_MUSIC", nil));

}

//Tests that _buttonSinginInTheRain has correct label, no hint, and opens up the correct webpage on press
- (void)testButtonSingingInTheRainOnPress {
    DEQAssertStringEqual([self.viewController playMusic:self.viewController.buttonSinginInTheRain], @"SIR");
    DEQAssertStringEqual(self.viewController.buttonStarSpangledBanner.accessibilityHint, NSLocalizedString(@"PLAYS_MUSIC", nil));

}

@end

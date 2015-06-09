//
//  IACLabelBrokenViewController_test.m
//  Accessibility 101
//
//  Created by Jennifer Dailey on 5/6/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "IACLabelBrokenViewController.h"
#import "DEQAsserts.h"

@interface IACLabelBrokenViewController_test : XCTestCase {
    @private
    IACLabelBrokenViewController* _viewController;
}

@end

@implementation IACLabelBrokenViewController_test

- (void)setUp {
    [super setUp];
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Storyboard" bundle:nil];
    _viewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"brokenLabel"];
    [_viewController view];
    
}

//Tests that each button has no label and no hint
- (void)testInitialSetUp {
    DEQAssertEmptyString(_viewController.dogDisplay.accessibilityLabel);
    DEQAssertEmptyString(_viewController.dogDisplay.accessibilityHint);
    DEQAssertEmptyString(_viewController.catDisplay.accessibilityLabel);
    DEQAssertEmptyString(_viewController.catDisplay.accessibilityHint);
    DEQAssertEmptyString(_viewController.fishDisplay.accessibilityLabel);
    DEQAssertEmptyString(_viewController.fishDisplay.accessibilityHint);
}

//Tests that imageView has accessibility features
- (void)testImageViewForAccessibilityFeatures {
    XCTAssertTrue(_viewController.imageView.isAccessibilityElement);
    DEQAssertEmptyString(_viewController.imageView.accessibilityHint);
    DEQAssertStringEqual(_viewController.imageView.accessibilityLabel, @"dog");
}

//Tests that image displays correct image, label, and hint when "dogDisplay" is pressed
- (void)testDogDisplayButtonClick {
    [_viewController displayImage:_viewController.dogDisplay];
    DEQAssertEmptyString(_viewController.imageView.accessibilityHint);
    DEQAssertStringEqual(_viewController.imageView.accessibilityLabel, @"dog");
}

//Tests that image displays correct image, label, and hint when "dogDisplay" is pressed
- (void)testCatDisplayButtonClick {
    [_viewController displayImage:_viewController.catDisplay];
    DEQAssertEmptyString(_viewController.imageView.accessibilityHint);
    DEQAssertStringEqual(_viewController.imageView.accessibilityLabel, @"cat");
}

//Tests that image displays correct image, label, and hint when "dogDisplay" is pressed
- (void)testFishDisplayButtonClick {
    [_viewController displayImage:_viewController.fishDisplay];
    DEQAssertEmptyString(_viewController.imageView.accessibilityHint);
    DEQAssertStringEqual(_viewController.imageView.accessibilityLabel, @"fish");
}

@end

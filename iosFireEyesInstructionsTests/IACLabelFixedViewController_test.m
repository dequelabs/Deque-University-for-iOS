//
//  IACLabelFixedViewController_test.m
//  Accessibility 101
//
//  Created by Jennifer Dailey on 5/6/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "IACLabelFixedViewController.h"
#import "DEQAsserts.h"

@interface IACLabelFixedViewController_test : XCTestCase {
    @private
    IACLabelFixedViewController* _viewController;
}
@end

@implementation IACLabelFixedViewController_test

- (void)setUp {
    [super setUp];
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Storyboard" bundle:nil];
    _viewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"fixedLabel"];
    [_viewController view];
}

//Tests that each button has the correct label and hint
- (void)testInitialSetUp {
    DEQAssertStringEqual(_viewController.dogDisplay.accessibilityLabel, @"Dog");
    DEQAssertStringEqual(_viewController.dogDisplay.accessibilityHint, @"Modify image.  Selection moves focus to image.");
    DEQAssertStringEqual(_viewController.catDisplay.accessibilityLabel, @"Cat");
    DEQAssertStringEqual(_viewController.catDisplay.accessibilityHint, @"Modify image.  Selection moves focus to image.");
    DEQAssertStringEqual(_viewController.fishDisplay.accessibilityLabel, @"Fish");
    DEQAssertStringEqual(_viewController.fishDisplay.accessibilityHint, @"Modify image.  Selection moves focus to image.");
}

//Tests that the imageView has the correct label and hint
- (void)testImageViewForAccessibilityFeatures {
    XCTAssertTrue(_viewController.imageView.isAccessibilityElement);
    DEQAssertEmptyString(_viewController.imageView.accessibilityHint);
    DEQAssertStringEqual(_viewController.imageView.accessibilityLabel, NSLocalizedString(@"DOG", nil));
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

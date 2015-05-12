//
//  IACTraitsBrokenViewController_test.m
//  Accessibility 101
//
//  Created by Jennifer Dailey on 5/12/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DQLog.h"
#import "IACTraitsBrokenViewController.h"

#define LOG_FLAG YES

#define DEQAssertStringEqual(testString, correctString) XCTAssert([testString isEqualToString:correctString], @"\"%@\"", testString)
#define DEQAssertStringEndsWith(testString, endsWithString) XCTAssert([testString hasSuffix:endsWithString], @"\"%@\"", testString)
#define DEQAssertEmptyString(testString) XCTAssert(testString == nil || [testString isEqualToString:@""], @"\"%@\"", testString)

@interface IACTraitsBrokenViewController_test : XCTestCase {
@private
    IACTraitsBrokenViewController* _viewController;
}
@end

@implementation IACTraitsBrokenViewController_test

- (void)setUp {
    [super setUp];
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Storyboard" bundle:nil];
    _viewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"brokenTrait"];
    [_viewController view];
}

//Tests that each button has the correct label and hint
- (void)testInitialSetUp {
    //ImageView
    DEQAssertStringEqual(_viewController.ImageView.accessibilityLabel, NSLocalizedString(@"DOG", nil));
    DEQAssertEmptyString(_viewController.ImageView.accessibilityHint);
    XCTAssert(_viewController.ImageView.isAccessibilityElement);
    
    //buttonDogDisplay
    DEQAssertStringEqual(_viewController.buttonDisplayDog.accessibilityLabel, @"Dog");
    DEQAssertEmptyString(_viewController.buttonDisplayDog.accessibilityHint);
    
    //buttonCatDisplay
    DEQAssertStringEqual(_viewController.buttonDisplayCat.accessibilityLabel, @"Cat");
    DEQAssertEmptyString(_viewController.buttonDisplayCat.accessibilityHint);
    
    //buttonFishDisplay
    DEQAssertStringEqual(_viewController.buttonDisplayFish.accessibilityLabel, @"Fish");
    DEQAssertEmptyString(_viewController.buttonDisplayFish.accessibilityHint);
}

//Tests that buttonDisplayDog acts as intended
- (void)testButtonDisplayDogOnPress {
    [_viewController displayImage:_viewController.buttonDisplayDog];
    DEQAssertEmptyString(_viewController.ImageView.accessibilityHint);
    DEQAssertStringEqual(_viewController.ImageView.accessibilityLabel, NSLocalizedString(@"DOG", nil));
    DEQAssertEmptyString(_viewController.buttonDisplayDog.accessibilityHint);
    DEQAssertStringEqual(_viewController.buttonDisplayDog.accessibilityLabel, @"Dog");
}

//Tests that buttonDisplayCat acts as intended
- (void)testButtonDisplayCatOnPress {
    [_viewController displayImage:_viewController.buttonDisplayCat];
    DEQAssertEmptyString(_viewController.ImageView.accessibilityHint);
    DEQAssertStringEqual(_viewController.ImageView.accessibilityLabel, NSLocalizedString(@"CAT", nil));
    DEQAssertEmptyString(_viewController.buttonDisplayCat.accessibilityHint);
    DEQAssertStringEqual(_viewController.buttonDisplayCat.accessibilityLabel, @"Cat");
}

//Tests that buttonDisplayFish acts as intended
- (void)testButtonDisplayFishOnPress {
    DEQAssertStringEqual([_viewController visitWebPage], @"http://lmgtfy.com/?q=fish");
    DEQAssertEmptyString(_viewController.ImageView.accessibilityHint);
    DEQAssertEmptyString(_viewController.buttonDisplayFish.accessibilityHint);
    DEQAssertStringEqual(_viewController.buttonDisplayFish.accessibilityLabel, @"Fish");
}

@end


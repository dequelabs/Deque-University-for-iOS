//
//  IACTraitsFixedViewController_test.m
//  Deque University for iOS
//
//  Created by Jennifer Dailey on 5/12/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "IACTraitsFixedViewController.h"
#import "DEQAsserts.h"

@interface IACTraitsFixedViewController_test : XCTestCase {
@private
    IACTraitsFixedViewController* _viewController;
}
@end

@implementation IACTraitsFixedViewController_test

- (void)setUp {
    [super setUp];
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Storyboard" bundle:nil];
    _viewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"fixedTrait"];
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
    DEQAssertStringEqual(_viewController.buttonDisplayDog.accessibilityHint, @"Display a picture");
    
    //buttonCatDisplay
    DEQAssertStringEqual(_viewController.buttonDisplayCat.accessibilityLabel, @"Cat");
    DEQAssertStringEqual(_viewController.buttonDisplayCat.accessibilityHint, @"Display a picture");
    
    //buttonFishDisplay
    DEQAssertStringEqual(_viewController.buttonDisplayFish.accessibilityLabel, @"Fish");
    DEQAssertStringEqual(_viewController.buttonDisplayFish.accessibilityHint, @"Google Search Fish");
}

//Tests that buttonDisplayDog acts as intended
- (void)testButtonDisplayDogOnPress {
    [_viewController displayImage:_viewController.buttonDisplayDog];
    DEQAssertEmptyString(_viewController.ImageView.accessibilityHint);
    DEQAssertStringEqual(_viewController.ImageView.accessibilityLabel, NSLocalizedString(@"DOG", nil));
    DEQAssertStringEqual(_viewController.buttonDisplayDog.accessibilityHint, @"Display a picture");
    DEQAssertStringEqual(_viewController.buttonDisplayDog.accessibilityLabel, @"Dog");
}

//Tests that buttonDisplayCat acts as intended
- (void)testButtonDisplayCatOnPress {
    [_viewController displayImage:_viewController.buttonDisplayCat];
    DEQAssertEmptyString(_viewController.ImageView.accessibilityHint);
    DEQAssertStringEqual(_viewController.ImageView.accessibilityLabel, NSLocalizedString(@"CAT", nil));
    DEQAssertStringEqual(_viewController.buttonDisplayCat.accessibilityHint, @"Display a picture");
    DEQAssertStringEqual(_viewController.buttonDisplayCat.accessibilityLabel, @"Cat");
}

//Tests that buttonDisplayFish acts as intended
- (void)testButtonDisplayFishOnPress {
    DEQAssertStringEqual(_viewController.buttonDisplayFish.accessibilityHint, @"Google Search Fish");
    DEQAssertStringEqual(_viewController.buttonDisplayFish.accessibilityLabel, @"Fish");
}

@end

//
//  IACHintBrokenVCTest.m
//  Accessibility 101
//
//  Created by Jennifer Dailey on 5/6/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "IACHintBrokenViewController.h"

#define DEQAssertStringEqual(testString, correctString) XCTAssert([testString isEqualToString:correctString], @"\"%@\"", testString)
#define DEQAssertStringEndsWith(testString, endsWithString) XCTAssert([testString hasSuffix:endsWithString], @"\"%@\"", testString)
#define DEQAssertEmptyString(testString) XCTAssert(testString == nil || [testString isEqualToString:@""], @"\"%@\"", testString)

@interface IACHintBrokenViewController (test)

@property (weak, nonatomic) IBOutlet UIButton *_buttonStarSpangledBanner;
@property (weak, nonatomic) IBOutlet UIButton *_buttonAmazingGrace;
@property (weak, nonatomic) IBOutlet UIButton *_buttonSinginInTheRain;
-(void)visitWebPage:(id)sender;

@end

@interface IACHintBrokenViewController_test : XCTestCase {
    @private
    IACHintBrokenViewController* _viewController;
}

@end



@implementation IACHintBrokenViewController_test

- (void)setUp {
    [super setUp];
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Storyboard" bundle:nil];
    _viewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"brokenHint"];
    [_viewController view];
}

//Tests that each button has correct label and no hint
- (void)testButtonsForAccessibilityFeatures {
    DEQAssertStringEqual(_viewController._buttonStarSpangledBanner.accessibilityLabel, @"Star Spangled Banner");
    DEQAssertEmptyString(_viewController._buttonStarSpangledBanner.accessibilityHint);
    DEQAssertStringEqual(_viewController._buttonAmazingGrace.accessibilityLabel, @"Amazing Grace");
    DEQAssertEmptyString(_viewController._buttonAmazingGrace.accessibilityHint);
    DEQAssertStringEqual(_viewController._buttonSinginInTheRain.accessibilityLabel, @"Singin In The Rain");
    DEQAssertEmptyString(_viewController._buttonSinginInTheRain.accessibilityHint);
}

//Tests that _buttonStarSpangledBanner has correct label and no hint after being pressed
- (void)testButtonStarSpangledBannerOnPress {
    [_viewController visitWebPage:_viewController._buttonStarSpangledBanner];
    DEQAssertStringEqual(_viewController._buttonStarSpangledBanner.accessibilityLabel, @"Star Spangled Banner");
    DEQAssertEmptyString(_viewController._buttonStarSpangledBanner.accessibilityHint);
}

@end

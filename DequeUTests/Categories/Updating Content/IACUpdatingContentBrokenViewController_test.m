//
//  IACUpdatingContentBrokenViewController_test.m
//  Deque University for iOS
//
//  Created by Jennifer Dailey on 6/24/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "IACUpdatingContentBrokenViewController.h"
#import "DEQAsserts.h"

@interface IACUpdatingContentBrokenViewController_test : XCTestCase {
    @private
    IACUpdatingContentBrokenViewController* _viewController;
}
@end

@implementation IACUpdatingContentBrokenViewController_test

- (void)setUp {
    [super setUp];
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"UpdatingContent" bundle:nil];
    _viewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"brokenUpdatingContent"];
    [_viewController view];
}

- (void)testSetUp {
    DEQAssertStringEqual(_viewController.progressLabel.text, @"0 seconds");
}

- (void)testUpdateProgressBar {
    
    //one second
    DEQAssertEmptyString([_viewController updateProgressBar:_viewController.myTimer]);
    DEQAssertStringEqual(_viewController.progressLabel.text, @"1 second");
    DEQAssertStringEqual(_viewController.wrapperView.accessibilityLabel, @"1 second");

    //two seconds
    DEQAssertEmptyString([_viewController updateProgressBar:_viewController.myTimer]);
    DEQAssertStringEqual(_viewController.progressLabel.text, @"2 seconds");
    DEQAssertStringEqual(_viewController.wrapperView.accessibilityLabel, @"2 seconds");

    //three seconds
    DEQAssertEmptyString([_viewController updateProgressBar:_viewController.myTimer]);
    DEQAssertStringEqual(_viewController.progressLabel.text, @"3 seconds");
    DEQAssertStringEqual(_viewController.wrapperView.accessibilityLabel, @"3 seconds");
    
    //four seconds
    DEQAssertEmptyString([_viewController updateProgressBar:_viewController.myTimer]);
    DEQAssertStringEqual(_viewController.progressLabel.text, @"4 seconds");
    DEQAssertStringEqual(_viewController.wrapperView.accessibilityLabel, @"4 seconds");
    
    //five seconds
    DEQAssertEmptyString([_viewController updateProgressBar:_viewController.myTimer]);
    DEQAssertStringEqual(_viewController.progressLabel.text, @"5 seconds");
    DEQAssertStringEqual(_viewController.wrapperView.accessibilityLabel, @"5 seconds");
    
    //six seconds
    DEQAssertEmptyString([_viewController updateProgressBar:_viewController.myTimer]);
    DEQAssertStringEqual(_viewController.progressLabel.text, @"6 seconds");
    DEQAssertStringEqual(_viewController.wrapperView.accessibilityLabel, @"6 seconds");
    
    //seven seconds
    DEQAssertEmptyString([_viewController updateProgressBar:_viewController.myTimer]);
    DEQAssertStringEqual(_viewController.progressLabel.text, @"7 seconds");
    DEQAssertStringEqual(_viewController.wrapperView.accessibilityLabel, @"7 seconds");
    
    //eight seconds
    DEQAssertEmptyString([_viewController updateProgressBar:_viewController.myTimer]);
    DEQAssertStringEqual(_viewController.progressLabel.text, @"8 seconds");
    DEQAssertStringEqual(_viewController.wrapperView.accessibilityLabel, @"8 seconds");
    
    //nine seconds
    DEQAssertEmptyString([_viewController updateProgressBar:_viewController.myTimer]);
    DEQAssertStringEqual(_viewController.progressLabel.text, @"9 seconds");
    DEQAssertStringEqual(_viewController.wrapperView.accessibilityLabel, @"9 seconds");
    
    //ten seconds
    DEQAssertEmptyString([_viewController updateProgressBar:_viewController.myTimer]);
    DEQAssertStringEqual(_viewController.progressLabel.text, @"10 seconds");
    DEQAssertStringEqual(_viewController.wrapperView.accessibilityLabel, @"10 seconds");
    
    //restart
    DEQAssertStringEqual([_viewController updateProgressBar:_viewController.myTimer], NSLocalizedString(@"TEN_SECOND_ALERT", nil));
    DEQAssertStringEqual(_viewController.progressLabel.text, @"10 seconds");
    DEQAssertStringEqual(_viewController.wrapperView.accessibilityLabel, @"10 seconds");
}

@end

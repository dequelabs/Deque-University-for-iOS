//
//  IACModalDialogueBrokenViewController_test.m
//  Deque University for iOS
//
//  Created by Alistair Barrell on 5/29/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//


#import <XCTest/XCTest.h>
#import "IACModalDialogBrokenViewController.h"
#import <DQA11y/DQA11y.h>
#import "DEQAsserts.h"

#define MAIL_TO_INDEX 0
#define VISIT_WEBSITE_INDEX 1
#define CLOSE_INDEX 2

@interface IACModalDialogueBrokenViewController_test : XCTestCase {
    @private
    IACModalDialogBrokenViewController* _viewController;
}

@end

@implementation IACModalDialogueBrokenViewController_test

- (void)setUp {
    [super setUp];
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"ModalDialog" bundle:nil];
    _viewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"ModalBroken"];
    [_viewController view];
}

- (void)testInformationMethod {
    XCTAssert([_viewController information:self]);
    
}

- (void)testButtonClick {
    DEQAssertStringEqual(@"mailto:chris.mcmeeking@deque.com", [_viewController getURLFromIndex:MAIL_TO_INDEX]);
    DEQAssertStringEqual(@"http://www.deque.com", [_viewController getURLFromIndex:VISIT_WEBSITE_INDEX]);
    DEQAssertEmptyString([_viewController getURLFromIndex:CLOSE_INDEX]);
}





@end

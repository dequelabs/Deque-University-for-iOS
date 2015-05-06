//
//  DQLabelFixedTest.m
//  Accessibility 101
//
//  Created by Meng Du on 5/1/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "IACLabelFixedViewController.h"
#import "DQLabel+Test.h"

#define DEQAssertStringEqual(testString, correctString) XCTAssert([testString isEqualToString:correctString], @"\"%@\"", testString)

@interface DQLabelFixedTest : XCTestCase

@property (strong, nonatomic) IACLabelFixedViewController *controller;

@end

@implementation DQLabelFixedTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Storyboard" bundle:nil];
    NSLog(@"%@", mainStoryboard);
    self.controller = [mainStoryboard instantiateViewControllerWithIdentifier:@"fixedLabel"];
    [self.controller performSelectorOnMainThread:@selector(loadView) withObject:nil waitUntilDone:YES];
    [self.controller performSelectorOnMainThread:@selector(viewDidLoad) withObject:nil waitUntilDone:YES];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testA_itemsOnLoad {
    XCTAssert([self.controller dogDisplay], @"Should not be nil");
    XCTAssert([self.controller catDisplay], @"Should not be nil");
    XCTAssert([self.controller fishDisplay], @"Should not be nil");
    XCTAssert([self.controller imageView], @"Should not be nil");
    
    DEQAssertStringEqual(self.controller.dogDisplay.accessibilityHint, @"Modify image.  Selection moves focus to image.");
    DEQAssertStringEqual(self.controller.dogDisplay.accessibilityLabel, @"dog");
    DEQAssertStringEqual(self.controller.catDisplay.accessibilityHint, @"Modify image display");
    DEQAssertStringEqual(self.controller.catDisplay.accessibilityLabel, @"cat");
    DEQAssertStringEqual(self.controller.fishDisplay.accessibilityHint, @"Modify image display");
    DEQAssertStringEqual(self.controller.fishDisplay.accessibilityLabel, @"fish");
    
    XCTAssertTrue([self.controller.imageView isAccessibilityElement]);
    DEQAssertStringEqual(self.controller.imageView.accessibilityLabel, @"dog");
    DEQAssertStringEqual(self.controller.imageView.accessibilityHint, @"a picture");
}

- (void)testB_buttonClick {
    // Display cat
    [self.controller displayImage: [self.controller catDisplay]];
    DEQAssertStringEqual(self.controller.imageView.accessibilityLabel, @"cat");
    DEQAssertStringEqual(self.controller.imageView.accessibilityHint, @"a picture");
    
    // Display fish
    [self.controller displayImage: [self.controller fishDisplay]];
    DEQAssertStringEqual(self.controller.imageView.accessibilityLabel, @"fish");
    DEQAssertStringEqual(self.controller.imageView.accessibilityHint, @"a picture");
    
    // Display dog
    [self.controller displayImage: [self.controller dogDisplay]];
    DEQAssertStringEqual(self.controller.imageView.accessibilityLabel, @"dog");
    DEQAssertStringEqual(self.controller.imageView.accessibilityHint, @"a picture");
    
    [self testA_itemsOnLoad];
}

@end

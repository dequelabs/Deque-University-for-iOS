//
//  DQLabelTest.m
//  Accessibility 101
//
//  Created by Meng Du on 4/2/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "DQLabelExampleViewController.h"
#import "DQBrokenLabelViewController.h"
#import "IACLabelFixedViewController.h"
#import "DQLabel+Test.h"

#define DEQAssertStringEqual(testString, correctString) XCTAssert([testString isEqualToString:correctString], @"\"%@\"", testString)

@interface DQLabelTest : XCTestCase

@property (strong, nonatomic) DQLabelExampleViewController *exampleController;
@property (strong, nonatomic) DQBrokenLabelViewController *brokenController;
@property (strong, nonatomic) IACLabelFixedViewController *fixedController;

@end

@implementation DQLabelTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    self.exampleController = [mainStoryboard instantiateViewControllerWithIdentifier:@"main"];
    [self.exampleController performSelectorOnMainThread:@selector(loadView) withObject:nil waitUntilDone:YES];
    [self.exampleController performSelectorOnMainThread:@selector(viewDidLoad) withObject:nil waitUntilDone:YES];
    
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testAItemsOnLoadExample {
    XCTAssert([self.exampleController view], @"Should not be nil");
    XCTAssert([self.exampleController exampleLabel], @"Should not be nil");
    XCTAssert([self.exampleController dogLabel], @"Should not be nil");
    XCTAssert([self.exampleController catLabel], @"Should not be nil");
    XCTAssert([self.exampleController fishLabel], @"Should not be nil");
    XCTAssert([self.exampleController dogDisplay], @"Should not be nil");
    XCTAssert([self.exampleController catDisplay], @"Should not be nil");
    XCTAssert([self.exampleController fishDisplay], @"Should not be nil");
    XCTAssert([self.exampleController textView], @"Should not be nil");
    XCTAssert([self.exampleController imageView], @"Should not be nil");
    
    DEQAssertStringEqual(self.exampleController.exampleLabel.text, @"Labels Example");
    DEQAssertStringEqual(self.exampleController.dogLabel.text, @"Display a picture of a dog:");
    DEQAssertStringEqual(self.exampleController.catLabel.text, @"Display a picture of a cat:");
    DEQAssertStringEqual(self.exampleController.fishLabel.text, @"Display a picture of a fish:");
    
    DEQAssertStringEqual(self.exampleController.dogDisplay.accessibilityHint, @"Modify image display");
    DEQAssertStringEqual(self.exampleController.dogDisplay.accessibilityLabel, @"dog");
    DEQAssertStringEqual(self.exampleController.catDisplay.accessibilityHint, @"Modify image display");
    DEQAssertStringEqual(self.exampleController.catDisplay.accessibilityLabel, @"cat");
    DEQAssertStringEqual(self.exampleController.fishDisplay.accessibilityHint, @"Modify image display");
    DEQAssertStringEqual(self.exampleController.fishDisplay.accessibilityLabel, @"fish");
    
    XCTAssertTrue([self.exampleController.imageView isAccessibilityElement]);
    DEQAssertStringEqual(self.exampleController.imageView.accessibilityLabel, @"dog");
    DEQAssertStringEqual(self.exampleController.imageView.accessibilityHint, @"a picture");
}


- (void)testAItemsOnLoadBroken {
    XCTAssert([self.brokenController view], @"Should not be nil");
    XCTAssert([self.brokenController dogDisplay], @"Should not be nil");
    XCTAssert([self.brokenController catDisplay], @"Should not be nil");
    XCTAssert([self.brokenController fishDisplay], @"Should not be nil");
    XCTAssert([self.brokenController textView], @"Should not be nil");
    XCTAssert([self.brokenController imageView], @"Should not be nil");
    
    XCTAssert(self.brokenController.dogDisplay.accessibilityHint == nil);
    XCTAssert(self.brokenController.dogDisplay.accessibilityLabel == nil);
    XCTAssert(self.brokenController.catDisplay.accessibilityHint == nil);
    XCTAssert(self.brokenController.catDisplay.accessibilityLabel == nil);
    XCTAssert(self.brokenController.fishDisplay.accessibilityHint == nil);
    XCTAssert(self.brokenController.fishDisplay.accessibilityLabel == nil);
    
    XCTAssertTrue([self.brokenController.imageView isAccessibilityElement]);
    DEQAssertStringEqual(self.brokenController.imageView.accessibilityLabel, @"dog");
    DEQAssertStringEqual(self.brokenController.imageView.accessibilityHint, @"a picture");
}


- (void)testBButtonClick {
    // Display cat
    [self.brokenController displayImage: [self.exampleController catDisplay]];
    DEQAssertStringEqual(self.brokenController.imageView.accessibilityLabel, @"cat");
    DEQAssertStringEqual(self.brokenController.imageView.accessibilityHint, @"a picture");
    
    // Display fish
    [self.brokenController displayImage: [self.exampleController fishDisplay]];
    DEQAssertStringEqual(self.brokenController.imageView.accessibilityLabel, @"fish");
    DEQAssertStringEqual(self.brokenController.imageView.accessibilityHint, @"a picture");
    
    // Display dog
    [self.brokenController displayImage: [self.exampleController dogDisplay]];
    DEQAssertStringEqual(self.brokenController.imageView.accessibilityLabel, @"dog");
    DEQAssertStringEqual(self.brokenController.imageView.accessibilityHint, @"a picture");
    
    [self testAItemsOnLoadExample];
}

@end

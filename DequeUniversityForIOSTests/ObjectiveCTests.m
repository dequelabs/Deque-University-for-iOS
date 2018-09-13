//
//  ObjectiveCTests.m
//  AttestiOSAppTests
//
//  Created by Jennifer Dailey on 12/20/17.
//  Copyright © 2017 Deque Systems Inc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Attest/Attest-Swift.h>

@interface ObjCTests : XCTestCase
@end

@implementation ObjCTests

/* The most simple test. Load the initial storyboard of main. The default isAccessible() call throws an exception on failure. */
- (void) testSimple {
    [[Attest thatWithStoryBoardName: @"Main" viewControllerID: NULL bundle: NULL]
     isAccessible: ^(Result* result) {
        NSLog(@"%s\n %@", "Attest Results", result.description);
     }];
}

/* Ignore a violation for a particular rule. */
- (void) testAndIgnoreSingleViolation {
    [[Attest thatWithStoryBoardName:@"ConflictingTraits" viewControllerID: NULL bundle:nil]
     isAccessible: ^(Result* result) {
         for (RuleResult* ruleResult in result.ruleResults) {
             switch (ruleResult.rule.ruleId) {
                 
                 // We're allowing one accessibility hint violation
                 case RuleIDConflictingTraits:
                     XCTAssertEqual(1, ruleResult.violations.count, @"%@", ruleResult.description);
                     break;
                     
                 case RuleIDImageViewName:
                     XCTAssertEqual(ImpactInapplicable, ruleResult.impact, @"%@", ruleResult.description);
                     break;

                // We're allowing this rule to be inapplicable to the view controller
                 case RuleIDCustomRule:
                    XCTAssertEqual(ImpactInapplicable, ruleResult.impact, @"%@", ruleResult.description);
                    break;
                 
                 // Everything else must pass
                 default:
                     XCTAssertEqual(ImpactPass, ruleResult.impact, @"%@", ruleResult.description);
                     break;
             }
         }
     }];
}
@end

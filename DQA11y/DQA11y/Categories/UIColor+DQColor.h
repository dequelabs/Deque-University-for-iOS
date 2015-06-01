//
//  UIColor+UIColor_DQColor.h
//  Accessibility 101
//
//  Created by Alistair Barrell on 5/26/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import <UIKit/UIKit.h>

/** 
 * Some simple interfaces for dealing with accessibility related color equality
 */
@interface UIColor (DQColor)

-(BOOL) isEqualToColorWithRed:(CGFloat)testred green:(CGFloat)testgreen blue:(CGFloat)testblue alpha:(CGFloat)testalpha;

-(BOOL) isEqualToColor:(UIColor *)color;

@end

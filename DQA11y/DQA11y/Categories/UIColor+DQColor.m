//
//  UIColor+UIColor_DQColor.m
//  Accessibility 101
//
//  Created by Alistair Barrell on 5/26/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//


#import "UIColor+DQColor.h"

@implementation UIColor (DQColor)

/**
 * If the exact rgba values for the color are known, use this function to compare colors.
 * We wrote this function because setting colors in the storyboard editor results in different RGBA values sometimes.
 */

- (BOOL)isEqualToColorWithRed:(CGFloat)testred green:(CGFloat)testgreen blue:(CGFloat)testblue alpha:(CGFloat)testalpha{
    
    CGFloat redVal;
    CGFloat greenVal;
    CGFloat blueVal;
    CGFloat alphaVal;
    
    [self getRed:&redVal green:&greenVal blue:&blueVal alpha:&alphaVal];
    
    return (testred -0.001 < redVal && testred+0.001 > redVal && testalpha -0.001 < alphaVal && testalpha +0.001 > alphaVal && testblue -0.001 < blueVal && testblue +0.001 > blueVal && testgreen -0.001 < greenVal && testgreen+ 0.001 > greenVal);
    
}

/**
 * Compares two UIColors
 */
- (BOOL)isEqualToColor:(UIColor *)color{
    
    CGFloat redVal;
    CGFloat greenVal;
    CGFloat blueVal;
    CGFloat alphaVal;
    CGFloat redCompare;
    CGFloat greenCompare;
    CGFloat blueCompare;
    CGFloat alphaCompare;
    
    [self getRed:&redVal green:&greenVal blue:&blueVal alpha:&alphaVal];
    [color getRed:&redCompare green:&greenCompare blue:&blueCompare alpha:&alphaCompare];
    
    return(redVal == redCompare && greenVal == greenCompare && blueVal == blueCompare && alphaVal == alphaCompare);
    
}

@end
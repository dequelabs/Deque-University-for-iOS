//
//  IACUtilities.h
//  Deque University for iOS
//
//  Created by Jennifer Dailey on 5/14/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import <UIKit/UIKit.h>

// Miscellaneous useful methods for this project
@interface IACUtilities : UINavigationController

//! Converts a hex code to a UIColor.
/*!
 * \param hex is an NSString; it is a color represented as a hex code.
 * \returns the UIColor equivalent to the hex code.
 */
+(UIColor*)colorWithHexString:(NSString*)hex; ///< Returns a UIColor given a Hex String

@end

//
//  IACTextView.h
//  Accessibility 101
//
//  Created by Chris McMeeking on 3/31/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 * DQTextView adds additional accessibility features to UITextView.
 */
@interface DQTextView : UITextView

+(BOOL)isValidContentSizeCategory:(NSString*const)contentSizeCategory; ///< Returns TRUE if the font type is a dynamic type. FALSE otherwise.

@end

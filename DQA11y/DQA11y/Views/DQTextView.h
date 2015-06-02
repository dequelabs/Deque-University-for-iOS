//
//  IACTextView.h
//  Accessibility 101
//
//  Created by Chris McMeeking on 3/31/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 * 
 */
@interface DQTextView : UITextView

+(BOOL)isValidContentSizeCategory:(NSString*const)contentSizeCategory;

@end

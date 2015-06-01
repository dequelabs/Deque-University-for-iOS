//
//  DEQDynamicTypeButton.h
//  FormValidation
//
//  Created by Chris McMeeking on 4/8/15.
//  Copyright (c) 2015 Deque Developer. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 * DQButton adds accessibility features to UIButton.
 */
@interface DQButton : UIButton

@property (getter=isUnderlined) BOOL underlined; ///< Whether or not the text in the button should be underlined
@property (getter=isShadowed) BOOL shadowed; ///< Whether or not the button should be shadowed

@end

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

@property (getter=isUnderlined) BOOL underlined; ///< Set to TRUE if text in DQButton should be underlined. FALSE otherwise.
@property (getter=isShadowed) BOOL shadowed; ///< Set to TRUE if DQButton should have a shadow. FALSE otherwise.

@end

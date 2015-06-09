//
//  IACDynamicNotificationsFixedViewController.h
//  Deque University for iOS
//
//  Created by Jennifer Dailey on 5/4/15.
//  Copyright (c) 2015 Jennifer Dailey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IACViewController.h"

//! The accessible (fixed) version of the Dynamic Notifications demonstration.
@interface IACDynamicNotificationsFixedViewController : IACViewController {
    IBOutlet UITextField* _textField; ///< The textField in which the user can add contacts.
    NSMutableArray* _contactList; ///< The list of contacts that the user has saved.
}

@property (readonly) UITextField* textField;
@property (readonly) NSMutableArray* contactList;

//! If the textField is not empty, it saves the text in the textField into the contactList array.
/*!
 * This function calls UIAccessibilityPostNotification to let the user know if the contact was successfully saved.
 * \returns the announcement stated by VoiceOver. This is used for testing purposes.
 */
-(NSString*)saveItem;

//! Empties the contactList (all elements in the table are deleted).
/*!
 * This function calls UIAccessibilityPostNotification to let the user know if the contactList was successfully deleted.
 * \returns the announcement stated by VoiceOver. This is used for testing purposes.
 */
-(NSString*)clearList;
-(void)textChanged; ///< Changes the textField's accessibilityLabel depending on if it is empty or not.

@end
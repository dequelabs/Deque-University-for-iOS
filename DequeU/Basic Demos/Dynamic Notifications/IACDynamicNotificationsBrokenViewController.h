//
//  IACDynamicNotificationsBrokenViewController.h
//  Deque University for iOS
//
//  Created by Jennifer Dailey on 5/4/15.
//  Copyright (c) 2015 Jennifer Dailey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IACViewController.h"

//! The broken version of the Dynamic Notifications demonstration.
@interface IACDynamicNotificationsBrokenViewController : IACViewController {
    IBOutlet UITextField* _textField; ///< The textField in which the user can add contacts.
    NSMutableArray* _contactList; ///< The list of contacts that the user has saved.
}

@property (readonly) UITextField* textField;
@property (readonly) NSMutableArray* contactList;

-(IBAction)saveItem; ///< If the textField is not empty, it saves the text from the textField into the contactList array.
-(IBAction)clearList; ///< Empties the contactList (all elements in table are deleted).
-(void)textChanged; ///< Changes the textField's accessibilityLabel depending on if it is empty or not.

@end

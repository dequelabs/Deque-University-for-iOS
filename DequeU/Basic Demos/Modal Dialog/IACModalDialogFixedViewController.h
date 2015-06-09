//
//  IACModalDialogFixedViewController.h
//  Deque University for iOS
//
//  Created by Jennifer Dailey on 5/26/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IACViewController.h"

/**
 * Fixed Modal Dialog
 */
//! The accessible (fixed) version of the Modal Dialog demonstration.
@interface IACModalDialogFixedViewController : IACViewController

@property (weak, nonatomic) IBOutlet UIButton *learnMoreLink; ///< The button that opens the modal dialog.

//! Creates and shows the modal dialog when the button is pressed, and has accessibility features.
/*!
 * The accessibility features include posting a notification that the modal dialog appeared and focusing on the dialog when it appears.
 * \param sender is the id of the button pressed.
 * \returns TRUE if the dialog is focused, and FALSE if the dialog is not focused. Used for testing purposes.
 */
- (BOOL)information:(id)sender;

@end

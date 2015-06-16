//
//  IACModalDialogFixedViewController.h
//  Deque University for iOS
//
//  Created by Jennifer Dailey on 5/26/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IACViewController.h"
#import "IACModalDialogViewController.h"

//! The accessible (fixed) version of the Modal Dialog demonstration.
@interface IACModalDialogFixedViewController : IACViewController {

    IACModalDialogViewController* modalViewController; ///< The viewController containing the modal dialog.
}


@property (weak, nonatomic) IBOutlet UIView *OpenAModalDialog; ///< The view that holds the "Open a modal dialog" label and learnMoreLink.
@property (weak, nonatomic) IBOutlet UIButton *learnMoreLink; ///< The button that opens the modal dialog.

//! Opens the modal dialog with accessibility features.
/*!
 * The accessibility features include posting a notification that the modal dialog appeared and focusing on the dialog when it appears.
 * \param sender is the id of the button pressed.
 * \returns TRUE if the dialog is focused, and FALSE if the dialog is not focused. Used for testing purposes.
 */
- (BOOL)information:(id)sender;

//! Will visit a webpage or go to a mailto link, depending on the button pressed. Will close the Modal Dialog.
/*!
 * \param sender is the id of the button pressed.
 * \returns an NSString of the URL the user visited (or nil if user pressed "Close"). Used for testing purposes.
 */
- (NSString*)clickedButton:(id)sender;

@end

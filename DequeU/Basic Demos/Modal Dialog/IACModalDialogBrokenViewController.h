//
//  IACModalDialogBrokenViewController.h
//  Deque University for iOS
//
//  Created by Jennifer Dailey on 5/26/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IACViewController.h"
#import "IACModalDialogViewController.h"

//! The broken version of the Modal Dialog demonstration.
/*! VoiceOver does not focus on the modal dialog when it appears. */
@interface IACModalDialogBrokenViewController : IACViewController {
    IACModalDialogViewController* _modalViewController; ///< The viewController containing the modal dialog.
}

//@property (weak, nonatomic) IACModalDialogViewController* modalViewController;
@property (weak, nonatomic) IBOutlet UIButton *iWouldLikeToLearnMoreLink; ///< The button that opens the modal dialog.

//! Opens a modal dialog, but will not be focused.
/*!
 * \param sender is the id of the button pressed.
 * \returns TRUE if the dialog is NOT focused, and FALSE if the dialog is focused. Used for testing purposes.
 */
- (BOOL)information:(id)sender;

//! Will visit a webpage or go to a mailto link, depending on the button pressed. Will close the modal dialog.
/*!
 * \param sender is the id of the button pressed.
 * \returns an NSString of the URL the user visited (or nil if user pressed "Close"). Used for testing purposes.
 */
- (NSString*)clickedButton:(id)sender;

@end

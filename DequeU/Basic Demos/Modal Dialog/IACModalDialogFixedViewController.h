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
@interface IACModalDialogFixedViewController : IACViewController

@property (weak, nonatomic) IBOutlet UIView *OpenAModalDialog; ///< The view that holds the "Open a modal dialog" label and learnMoreLink.
@property (weak, nonatomic) IBOutlet UIButton *learnMoreLink; ///< The button that opens the modal dialog.
@property IACModalDialogViewController* modalDialogViewController; ///< The modal dialog.

//! Creates and shows the modal dialog when the button is pressed, and has accessibility features.
/*!
 * The accessibility features include posting a notification that the modal dialog appeared and focusing on the dialog when it appears.
 * \param sender is the id of the button pressed.
 */
- (void)information:(id)sender;

//! Retrieves the corresponding URL from the button that was pressed.
/*!
 * \param sender is the id of the button that was pressed.
 * \returns an NSString of the URL that was visited. (Close button returns 'nil'). Used for testing purposes.
 */
- (NSString*)visitWebpage:(id)sender;


@end

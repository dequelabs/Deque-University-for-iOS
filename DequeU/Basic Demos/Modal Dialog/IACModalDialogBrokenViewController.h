//
//  IACModalDialogBrokenViewController.h
//  Deque University for iOS
//
//  Created by Jennifer Dailey on 5/26/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <DQA11y/DQA11y.h>
#import "IACViewController.h"
#import "CustomIOS7AlertView.h"

//! The broken version of the Modal Dialog demonstration.
/*! VoiceOver does not focus on the modal dialog when it appears. */
@interface IACModalDialogBrokenViewController : IACViewController

@property (weak, nonatomic) IBOutlet UIButton *iWouldLikeToLearnMoreLink; ///< The button that opens the modal dialog.
@property (weak, nonatomic) IBOutlet DQWrapperView *wrapperView; ///< The view containing iWouldLikeToLearnMore and the "Open a modal dialog" label.

//! Creates and shows the modal dialog when the button is pressed. The dialog will not be focused.
/*!
 * \param sender is the id of the button pressed.
 * \returns TRUE if the dialog is NOT focused, and FALSE if the dialog is focused. Used for testing purposes.
 */
- (BOOL)information:(id)sender;

//! Retrieves the corresponding URL from the button that was pressed.
/*!
 * \param buttonIndex is an NSInteger that is the index of the button that was pressed.
 * \returns an NSString of the URL that will be visited.
 */
- (NSString*)getURLFromIndex:(NSInteger)buttonIndex;

@end

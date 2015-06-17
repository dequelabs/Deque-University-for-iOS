//
//  IACFormsValidationBrokenViewController.h
//  Deque University for iOS
//
//  Created by Chris McMeeking on 4/2/15.
//  Copyright (c) 2015 Deque Developer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IACViewController.h"

//! The broken version of the Forms Validation demonstration.
@interface IACFormsValidationBrokenViewController : IACViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *dateLabel; ///< Label named "Date."
@property (weak, nonatomic) IBOutlet UILabel *emailLabel; ///< Label named "Email."
@property (weak, nonatomic) IBOutlet UILabel *nameLabel; ///< Label named "Name."
@property (weak, nonatomic) IBOutlet UITextField *nameField; ///< TextField asking for the user's name.
@property (weak, nonatomic) IBOutlet UITextField *dateField; ///< TextField asking for the date (must be in mm/dd/yyyy format).
@property (weak, nonatomic) IBOutlet UITextField *emailField; ///< TextField asking for the user's email address (must be a valid email).
@property (weak, nonatomic) IBOutlet UILabel *nameReq;  ///< Visual hint letting the user know that "Name" is required.
@property (weak, nonatomic) IBOutlet UILabel *emailReq; ///< Visual hint letting the user know that "Email" is required.
@property (weak, nonatomic) IBOutlet UILabel *dateReq; ///< Visual hint letting the user know that "Date" is required.
@property (weak, nonatomic) IBOutlet UIImageView *logo; ///< The Deque logo at the top of the page.

//! All three textFields are checked are validated, using the function "validateTextField", which can be found in IACFormsValidationFixedViewController.m.
/*! \param sender is the id of the submit button. */
- (IBAction)submitButton:(id)sender;

//! When the background is tapped, the keyboard disappears.
/*! \param sender is the id of the background. */
- (IBAction)backgroundTap:(id)sender;

@end


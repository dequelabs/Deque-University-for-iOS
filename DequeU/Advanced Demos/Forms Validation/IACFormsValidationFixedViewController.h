//
//  IACFormsValidationFixedViewController.h
//  Deque University for iOS
//
//  Created by Alistair Barrell on 2/27/15.
//  Copyright (c) Deque Systems 2015. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IACViewController.h"
#import <DQA11y/DQA11y.h>

//! The accessible (fixed) version of the Forms Validation demonstration.
@interface IACFormsValidationFixedViewController : IACViewController <UITextFieldDelegate>


@property (weak, nonatomic) IBOutlet UILabel *nameLabel; ///< Label named "Name."
@property (weak, nonatomic) IBOutlet UITextField *nameField; ///< TextField asking for the user's name.
@property (weak, nonatomic) IBOutlet UILabel *nameRequirement; ///< Visual hint letting the user know that "Name" is required.

@property (weak, nonatomic) IBOutlet UILabel *emailLabel; ///< Label named "Email."
@property (weak, nonatomic) IBOutlet UITextField *emailField; ///< TextField asking for the user's email (must be a valid email).
@property (weak, nonatomic) IBOutlet UILabel *emailRequirement; ///< Visual hint letting the user know that "Email" is required.

@property (weak, nonatomic) IBOutlet UILabel *dateLabel; ///< Label named "Date."
@property (weak, nonatomic) IBOutlet UITextField *dateField; ///< TextField asking for the date (must be in mm/dd/yyyy format).
@property (weak, nonatomic) IBOutlet UILabel *dateRequirement; ///< Visual hint letting the user know that "Date" is required.

@property (weak, nonatomic) IBOutlet UIImageView *dequeLogo; ///< The Deque logo at the top of the page.

@property (weak, nonatomic) IBOutlet DQButton *submitButton; ///< Button to submit data.

//! All three textFields are checked are validated, using the function "validateTextField" (which can be found in the .m file).
/*! \param sender is the id of the submit button. */
- (IBAction)submitButton:(id)sender;

//! When the background is tapped, the keyboard disappears.
/*! \param sender is the id of the background. */
- (IBAction)backgroundTap:(id)sender;

@end


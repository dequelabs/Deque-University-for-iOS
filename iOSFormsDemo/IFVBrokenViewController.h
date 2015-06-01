//
//  IFVBadViewController.h
//  iOSFormsDemo
//
//  Created by Chris McMeeking on 4/2/15.
//  Copyright (c) 2015 Deque Developer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IACViewController.h"

/**
 * This is the broken version of the Forms demo.
 */

@interface IFVBrokenViewController : IACViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *dateField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UILabel *nameReq;
@property (weak, nonatomic) IBOutlet UILabel *emailReq;
@property (weak, nonatomic) IBOutlet UILabel *dateReq;
@property (weak, nonatomic) IBOutlet UIImageView *logo;

- (IBAction)submitButton:(id)sender;
- (IBAction)backgroundTap:(id)sender;

@end


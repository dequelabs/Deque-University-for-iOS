//
//  IACModalDialogViewController.h
//  DequeU
//
//  Created by Jennifer Dailey on 6/15/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <DQA11y/DQA11y.h>

//! View Controller used as the Modal Dialog.
@interface IACModalDialogViewController : UIViewController

@property (weak, nonatomic) IBOutlet DQLabel *modalDialogTitle; ///< Title of the modal dialog.
@property (weak, nonatomic) IBOutlet DQLabel *modalDialogDescription; ///< Description written in the modal dialog.
@property (weak, nonatomic) IBOutlet DQButton *email_us_button; ///< When pressed, sends user to a mailto link and closes modal dialog.
@property (weak, nonatomic) IBOutlet DQButton *visit_our_website_button; ///< When pressed, sends user to Deque website and closes modal dialog.
@property (weak, nonatomic) IBOutlet DQButton *close_button; ///< When pressed, closes the modal dialog.

@end

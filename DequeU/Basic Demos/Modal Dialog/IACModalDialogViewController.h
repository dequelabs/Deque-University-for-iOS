//
//  IACModalDialogViewController.h
//  Deque University for iOS
//
//  Created by Jennifer Dailey on 6/11/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <DQA11y/DQA11y.h>

//! The view controller that contains the modal dialog's content.
@interface IACModalDialogViewController : UIViewController
@property (weak, nonatomic) IBOutlet DQButton *email_deque; ///< The "Email Us!" button.
@property (weak, nonatomic) IBOutlet DQButton *visit_website; ///< The "Visit Website!" button.
@property (weak, nonatomic) IBOutlet DQButton *close; ///< The "Close" button.


@end

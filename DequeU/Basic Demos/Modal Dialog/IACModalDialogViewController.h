//
//  IACModalDialogViewController.h
//  DequeU
//
//  Created by Jennifer Dailey on 6/15/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <DQA11y/DQA11y.h>

@interface IACModalDialogViewController : UIViewController
@property (weak, nonatomic) IBOutlet DQButton *email_us_button;
@property (weak, nonatomic) IBOutlet DQButton *visit_our_website_button;
@property (weak, nonatomic) IBOutlet DQButton *close_button;

@end

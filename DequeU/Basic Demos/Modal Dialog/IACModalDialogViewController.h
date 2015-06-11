//
//  IACModalDialogViewController.h
//  Deque University for iOS
//
//  Created by Jennifer Dailey on 6/11/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <DQA11y/DQA11y.h>

@interface IACModalDialogViewController : UIViewController

@property (weak, nonatomic) IBOutlet DQButton *email_deque;
@property (weak, nonatomic) IBOutlet DQButton *visit_website;
@property (weak, nonatomic) IBOutlet DQButton *close;


@end

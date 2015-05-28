//
//  IACDynamicNotificationsFixedViewController.h
//  Accessibility 101
//
//  Created by Jennifer Dailey on 5/4/15.
//  Copyright (c) 2015 Jennifer Dailey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IACViewController.h"

@interface IACDynamicNotificationsFixedViewController : IACViewController {
    IBOutlet UITextField* _textField;
    NSMutableArray* _contactList;
}

@property (readonly) UITextField* textField;
@property (readonly) NSMutableArray* contactList;

-(NSString*)saveItem;
-(NSString*)clearList;
-(void)textChanged;

@end
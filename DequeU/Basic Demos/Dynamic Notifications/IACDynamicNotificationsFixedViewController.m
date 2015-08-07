//
//  IACDynamicNotificationsFixedViewController.m
//  Deque University for iOS
//
//  Created by Jennifer Dailey on 5/4/15.
//  Copyright (c) 2015 Jennifer Dailey. All rights reserved.
//

#import "IACDynamicNotificationsFixedViewController.h"
#import <DQA11y/DQA11y.h>

@interface IACDynamicNotificationsFixedViewController () <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>

@property IBOutlet UIButton* clearContactsButton; ///< The clearContact button. When pressed, calls "clearList" method.
@property IBOutlet UIButton* saveButton; ///< The saveButton. When pressed, calls "saveItem" method.
@property IBOutlet UITableView* tableView; ///< The tableView that displays all elements in _contactList.

@end

@implementation IACDynamicNotificationsFixedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _contactList = [[NSMutableArray alloc] init];
    
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _textField.delegate = self;
    
    [_saveButton addTarget:self action:@selector(saveItem) forControlEvents:UIControlEventTouchDown];
    [_clearContactsButton addTarget:self action:@selector(clearList) forControlEvents:UIControlEventTouchDown];
}

- (NSString*)clearList {
    NSString *announcement;
    
    //Creates announcement for if the list was cleared when clearContacts button was pressed.
    if([_contactList count] == 0) {
        announcement = NSLocalizedString(@"NO_CONTACTS", nil);
    } else {
        announcement = NSLocalizedString(@"CONTACTS_DELETED", nil);
    }
    
    [_contactList removeAllObjects];
    [_tableView reloadData];
    [DQUtilities createDynamicNotification:announcement]; // Prompts VoiceOver to announce the change in the list.
    
    return announcement;
}

- (NSString*)saveItem {
    NSString* announcement;
    NSString* item;
    
    if(_textField.text.length > 0) {
        item = _textField.text;
        _textField.text = @"";
        announcement = [item stringByAppendingString:NSLocalizedString(@"ADDED_CONTACT", nil)]; // Creates announcement that item was added to list.
        
        [_contactList addObject:item];
        [_tableView reloadData];
    } else {
        announcement = NSLocalizedString(@"EMPTY_TEXTFIELD", nil); // Creates announcement that no item was added to list (textField is empty).
    }
    
    [_textField resignFirstResponder];
    [DQUtilities createDynamicNotification:announcement]; // Prompts VoiceOver to announce the change in the list.
    
    return announcement;
}

//Delegate method for UITableView.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

//Delegate method for UITableView.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_contactList count];
}

//Delegate method for UITableView. Displays every element in _contactList.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *item = [_contactList objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListPrototypeCell" forIndexPath:indexPath];
    
    cell.textLabel.text = item;
    cell.isAccessibilityElement = YES;
    
    return cell;
}

//Delegate method for UITableView.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

//Delegate method for UITextField.
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    
    return YES;
}

@end
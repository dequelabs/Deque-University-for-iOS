//
//  IACDynamicNotificationsFixedViewController.m
//  Accessibility 101
//
//  Created by Jennifer Dailey on 5/4/15.
//  Copyright (c) 2015 Jennifer Dailey. All rights reserved.
//

#import "IACDynamicNotificationsFixedViewController.h"
#import "DQLog.h"
#import "DQUtilities.h"
#import "DQConstants.h"
#import "IACUtilities.h"

#define LOG_FLAG YES

@interface IACDynamicNotificationsFixedViewController () <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>

@property IBOutlet UIButton* _clearContacts;
@property IBOutlet UIButton* _saveButton;
@property IBOutlet UITableView* _tableView;
@property NSString* item;
@property UIColor* backgroundColorView;

@end

@implementation IACDynamicNotificationsFixedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _contactList = [[NSMutableArray alloc] init];
    
    _contactList.isAccessibilityElement = YES;
    self._tableView.dataSource = self;
    self._tableView.delegate = self;
    _textField.delegate = self;
    _textField.accessibilityLabel = @"";
    
    [self._saveButton addTarget:self action:@selector(saveItem) forControlEvents:UIControlEventTouchDown];
    [self._clearContacts addTarget:self action:@selector(clearList) forControlEvents:UIControlEventTouchDown];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(textChanged)
                                                 name:UITextFieldTextDidChangeNotification object:nil];
    
    self.backgroundColorView = [IACUtilities colorWithHexString:DQ_COLOR_WORLDSPACE_GREEN];
    self.view.backgroundColor = self.backgroundColorView;
}

- (NSString*)clearList {
    NSString *announcement;
    
    if([_contactList count] == 0) {
        announcement = NSLocalizedString(@"NO_CONTACTS", nil);
    } else {
        announcement = NSLocalizedString(@"CONTACTS_DELETED", nil);
    }
    
    [_contactList removeAllObjects];
    [self._tableView reloadData];
    [DQUtilities createDynamicNotification:announcement];
    
    return announcement;
}

- (NSString*)saveItem {
    NSString *announcement;
    
    if(_textField.text.length > 0) {
        self.item = _textField.text;
        _textField.text = @"";
        announcement = [self.item stringByAppendingString:NSLocalizedString(@"ADDED_CONTACT", nil)];
        
        [_contactList addObject:self.item];
        [self._tableView reloadData];
    } else {
        announcement = NSLocalizedString(@"EMPTY_TEXTFIELD", nil);
    }
    
    [_textField resignFirstResponder];
    [DQUtilities createDynamicNotification:announcement];
    _textField.accessibilityLabel = @"";
    
    return announcement;
}

- (void)textChanged {
    if(_textField.text.length > 0) {
        _textField.accessibilityLabel = NSLocalizedString(@"FIRST_NAME", nil);
    } else {
        _textField.accessibilityLabel = @"";
    }
}


//Delegate method for UITableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

//Delegate method for UITableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [_contactList count];
}

//Delegate method for UITableView
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *item = [_contactList objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListPrototypeCell" forIndexPath:indexPath];
    
    cell.textLabel.text = item;
    cell.isAccessibilityElement = YES;
    
    return cell;
}

//Delegate method for UITableView
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

//Delegate method for UITextField
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    
    return YES;
}

@end
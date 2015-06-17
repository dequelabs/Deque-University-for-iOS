//
//  IACDynamicNotificationsBrokenViewController.m
//  Deque University for iOS
//
//  Created by Jennifer Dailey on 5/4/15.
//  Copyright (c) 2015 Jennifer Dailey. All rights reserved.
//

#import "IACDynamicNotificationsBrokenViewController.h"

@interface IACDynamicNotificationsBrokenViewController () <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>

@property IBOutlet UITableView *_tableView; // The tableView that displays all elements in _contactList.

@end

@implementation IACDynamicNotificationsBrokenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _contactList = [[NSMutableArray alloc] init];
    _contactList.isAccessibilityElement = YES;
    self._tableView.dataSource = self;
    self._tableView.delegate = self;
    _textField.delegate = self;
    
    // Listener for when the textField's content changes.
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(textChanged)
                                                 name:UITextFieldTextDidChangeNotification object:nil];
}

- (IBAction)clearList {
    [_contactList removeAllObjects];
    [self._tableView reloadData];
}

- (IBAction)saveItem {
    NSString* _item;
    
    if(_textField.text.length > 0) {
        _item = _textField.text;
        
        [_contactList addObject:_item];
        [self._tableView reloadData];
        _textField.text = @"";
    }
    [_textField resignFirstResponder];
    _textField.accessibilityLabel = @"";
}

- (void)textChanged {
    if(_textField.text.length > 0) {
        _textField.accessibilityLabel = NSLocalizedString(@"FIRST_NAME", nil);
    } else {
        _textField.accessibilityLabel = @"";
    }
}

// Delegate method in UITableView.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// Delegate method in UITableView.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_contactList count];
}

// Delegate method in UITableView.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListPrototypeCell" forIndexPath:indexPath];
    
    NSString *item = [_contactList objectAtIndex:indexPath.row];
    cell.textLabel.text = item;
    [cell setAccessibilityLabel:item];
    
    return cell;
}

// Delegate method in UITableView.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

// Delegate method in UITextField.
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    
    return YES;
}

@end

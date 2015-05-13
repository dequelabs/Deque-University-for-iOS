//
//  IACStoryTableTableViewController.m
//  Accessibility 101
//
//  Created by Chris McMeeking on 4/14/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import "IACStoryTableViewController.h"
#import "UIView+DQView.h"

#define REUSE_IDENTIFIER @"StoryCell"
#define STORY_LABEL_TAG 101

@implementation IACStoryTableViewController {
    NSArray* _viewControllers;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
   self.tableView.delegate = self;
    self.clearsSelectionOnViewWillAppear = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    UIStoryboard* storyBoard = [UIStoryboard storyboardWithName:@"Storyboard" bundle:nil];
    NSMutableArray* tempArray = [NSMutableArray array];
    
    [tempArray addObject:[storyBoard instantiateViewControllerWithIdentifier:@"Introduction"]];
    [tempArray addObject:[storyBoard instantiateViewControllerWithIdentifier:@"LabelStory"]];
    [tempArray addObject:[storyBoard instantiateViewControllerWithIdentifier:@"HintStory"]];
    [tempArray addObject:[storyBoard instantiateViewControllerWithIdentifier:@"TraitStory"]];
    [tempArray addObject:[storyBoard instantiateViewControllerWithIdentifier:@"NestedA11yStory"]];
    [tempArray addObject:[storyBoard instantiateViewControllerWithIdentifier:@"DynamicTypeStory"]];
    
    UIStoryboard* dynamic = [UIStoryboard storyboardWithName:@"DynamicNotifications" bundle:nil];
    [tempArray addObject:[dynamic instantiateViewControllerWithIdentifier:@"DynamicNotifications"]];

    _viewControllers = [NSArray arrayWithArray:tempArray];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _viewControllers.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:REUSE_IDENTIFIER forIndexPath:indexPath];
    
    UILabel* label = (UILabel*)[cell viewWithTag:STORY_LABEL_TAG];
    
    UIViewController* viewController = [_viewControllers objectAtIndex:indexPath.row];
    label.text = viewController.title;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController* viewController = [_viewControllers objectAtIndex:indexPath.row];
    
    [self.splitViewController showDetailViewController:viewController sender:nil];
}

@end

//
//  IACStoryTableTableViewController.m
//  Accessibility 101
//
//  Created by Chris McMeeking on 4/14/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import "IACStoryTableViewController.h"
#import "UIView+DQView.h"
#import "DQConstants.h"
#import "IACUtilities.h"

#define REUSE_IDENTIFIER @"StoryCell"
#define STORY_LABEL_TAG 101

@interface IACStoryTableViewController ()

@property(nonatomic, readwrite, retain) UIView* backgroundView;

@end

@implementation IACStoryTableViewController {
    NSArray* _viewControllers;
    
    //Color Scheme
    UIColor* _colorCellBackgroundDimmed;
    UIColor* _colorCellBackgroundSelected;
    UIColor* _colorCellBackgroundDimmedDarkened;
    UIColor* _colorCellBackgroundSelectedDarkened;
    UIColor* _colorCellTextDimmed;
    UIColor* _colorCellTextSelected;
    UIColor* _colorCellTextDimmedDarkened;
    UIColor* _colorCellTextSelectedDarkened;
    UIColor* _colorMenuBackground;
    UIColor* _colorMenuBackgroundDarkened;
    
    BOOL DARKEN_COLORS;
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
    
    UIStoryboard* form = [UIStoryboard storyboardWithName:@"FormsValidation" bundle:nil];
    [tempArray addObject:[form instantiateViewControllerWithIdentifier:@"FormsValidation"]];
    
    _viewControllers = [NSArray arrayWithArray:tempArray];
    
    //color scheme
    _colorCellBackgroundDimmed = [UIColor darkGrayColor];
    _colorCellBackgroundSelected = [IACUtilities colorWithHexString:DQ_COLOR_WORLDSPACE_GREEN];
    _colorCellBackgroundDimmedDarkened = [IACUtilities colorWithHexString:DQ_COLOR_WORLDSPACE_BLACK];
    _colorCellBackgroundSelectedDarkened = [IACUtilities colorWithHexString:DQ_COLOR_WORLDSPACE_GREEN];
    _colorCellTextDimmed = [UIColor whiteColor];
    _colorCellTextSelected = [UIColor darkGrayColor];
    _colorCellTextDimmedDarkened = [UIColor whiteColor];
    _colorCellTextSelectedDarkened = [IACUtilities colorWithHexString:DQ_COLOR_WORLDSPACE_BLACK];
    _colorMenuBackground = [UIColor darkGrayColor];
    _colorMenuBackgroundDarkened = [IACUtilities colorWithHexString:DQ_COLOR_WORLDSPACE_BLACK];
    
    self.tableView.backgroundView = nil;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(observeDarkenColorsSetting)
                                                 name:UIAccessibilityDarkerSystemColorsStatusDidChangeNotification
                                               object:nil];
    [self observeDarkenColorsSetting];
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
    
    DARKEN_COLORS = UIAccessibilityDarkerSystemColorsEnabled();
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = DARKEN_COLORS ? _colorCellBackgroundDimmedDarkened : _colorCellBackgroundDimmed;
    label.textColor = DARKEN_COLORS ? _colorCellTextDimmedDarkened : _colorCellTextDimmed;

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController* viewController = [_viewControllers objectAtIndex:indexPath.row];
    
    [self.splitViewController showDetailViewController:viewController sender:nil];
    [self observeDarkenColorsSetting];
}

-(void)observeDarkenColorsSetting  {
    
    DARKEN_COLORS = UIAccessibilityDarkerSystemColorsEnabled();
    self.tableView.backgroundColor = DARKEN_COLORS ? _colorMenuBackgroundDarkened : _colorMenuBackground;
    
    NSArray* cells = [self.tableView visibleCells];
    
    for(UITableViewCell* cell in cells) {
        UILabel* label = (UILabel*)[cell viewWithTag:STORY_LABEL_TAG];
        
        if(cell.isSelected) {
            cell.backgroundColor = DARKEN_COLORS ? _colorCellBackgroundSelectedDarkened : _colorCellBackgroundSelected;
            label.textColor = DARKEN_COLORS ? _colorCellTextSelectedDarkened : _colorCellTextSelected;
        } else {
            cell.backgroundColor = DARKEN_COLORS ? _colorCellBackgroundDimmedDarkened : _colorCellBackgroundDimmed;
            label.textColor = DARKEN_COLORS ? _colorCellTextDimmedDarkened : _colorCellTextDimmed;
        }
    }
}

@end

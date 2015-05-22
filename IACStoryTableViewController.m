//
//  IACStoryTableTableViewController.m
//  Accessibility 101
//
//  Created by Chris McMeeking on 4/14/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import "IACStoryTableViewController.h"
#import "IACViewController.h"
#import "UIView+DQView.h"
#import "IACConstants.h"
#import "IACUtilities.h"
#import "DQConstants.h"

#define OVERLAY_IDENTIFIER @"Overlay"
#define INTRODUCTION_IDENTIFIER @"Introduction"
#define DEMO_TITLE_IDENTIFIER @"Demos"
#define STORY_IDENTIFIER @"StoryCell"

#define OVERLAY_IMAGE_TAG 93
#define OVERLAY_SWITCH_TAG 92
#define DEMO_TITLE_TAG 90
#define STORY_LABEL_TAG 101
#define STORY_IMAGE_TAG 110

#define OVERLAY_SECTION_NUM 0
#define INTRODUCTION_SECTION_NUM 1
#define DEMONSTRATIONS_SECTION_NUM 2
#define LIST_OF_DEMOS_SECTION_NUM 3

@implementation IACStoryTableViewController {
    NSArray* _viewControllers;
    UIViewController* _introduction;
    UISwitch* overlaySwitch;
    UIImageView* sightImage;
    
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
    
    //silencing constraint error
    self.tableView.rowHeight = 44;
    
    self.tableView.delegate = self;
    self.clearsSelectionOnViewWillAppear = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    UIStoryboard* storyBoard = [UIStoryboard storyboardWithName:@"Storyboard" bundle:nil];
    NSMutableArray* tempArray = [NSMutableArray array];
    
    _introduction = [storyBoard instantiateViewControllerWithIdentifier:@"Introduction"];
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
    [[UINavigationBar appearance] setTitleTextAttributes: @{NSForegroundColorAttributeName: [IACUtilities colorWithHexString:BLUE]}];
    
    _colorCellBackgroundDimmed = [IACUtilities colorWithHexString:DQ_COLOR_WORLDSPACE_WHITE];
    _colorCellBackgroundSelected = [IACUtilities colorWithHexString:LIGHT_BLUE];
    _colorCellBackgroundDimmedDarkened = [IACUtilities colorWithHexString:DQ_COLOR_WORLDSPACE_WHITE];
    _colorCellBackgroundSelectedDarkened = [IACUtilities colorWithHexString:LIGHT_BLUE];
    _colorCellTextDimmed = [IACUtilities colorWithHexString:DARK_BLUE];
    _colorCellTextSelected = [IACUtilities colorWithHexString:DARK_BLUE];
    _colorCellTextDimmedDarkened = [IACUtilities colorWithHexString:DARK_BLUE];
    _colorCellTextSelectedDarkened = [IACUtilities colorWithHexString:DARK_BLUE];
    _colorMenuBackground = [IACUtilities colorWithHexString:DQ_COLOR_WORLDSPACE_WHITE];
    _colorMenuBackgroundDarkened = [IACUtilities colorWithHexString:DQ_COLOR_WORLDSPACE_WHITE];
    
    self.tableView.backgroundView = nil;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(observeDarkenColorsSetting)
                                                 name:UIAccessibilityDarkerSystemColorsStatusDidChangeNotification
                                               object:nil];
    
    //selecting introduction cell
    NSIndexPath* indexPath = [NSIndexPath indexPathForRow:0 inSection:1];
    [self.tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionBottom];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self setState:NO];
    [self observeDarkenColorsSetting];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if(section == LIST_OF_DEMOS_SECTION_NUM) {
        return _viewControllers.count;
    } else {
        return 1;
    }
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if(indexPath.section == OVERLAY_SECTION_NUM) {

        [self toggleState];
        
        return nil;
        
    } else if (indexPath.section == DEMONSTRATIONS_SECTION_NUM) {
        return nil;
        
    } else {
        return indexPath;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell* cell;
    UILabel* label;
    UIImageView* image;
    DARKEN_COLORS = UIAccessibilityDarkerSystemColorsEnabled();
    
    if(indexPath.section == OVERLAY_SECTION_NUM) {
        
        cell = [tableView dequeueReusableCellWithIdentifier:OVERLAY_IDENTIFIER forIndexPath:indexPath];
        sightImage = (UIImageView*)[cell viewWithTag:OVERLAY_IMAGE_TAG];
        overlaySwitch = (UISwitch*)[cell viewWithTag:OVERLAY_SWITCH_TAG];
        
        //creating overlaySwitch
        [overlaySwitch addTarget:self action:@selector(observeSwitchState) forControlEvents:UIControlEventValueChanged];
        
        //setting accessibility hint
        [cell setAccessibilityHint:NSLocalizedString(@"TOGGLE_SETTING_HINT", nil)];
        
    } else if(indexPath.section == INTRODUCTION_SECTION_NUM) {
        
        cell = [tableView dequeueReusableCellWithIdentifier:INTRODUCTION_IDENTIFIER forIndexPath:indexPath];
        label = (UILabel*)[cell viewWithTag:STORY_LABEL_TAG];
        image = (UIImageView*)[cell viewWithTag:STORY_IMAGE_TAG];
        
        label.text = _introduction.title;
        [image setImage:[UIImage imageNamed:label.text]];
        
        //setting accessibility label
        NSString* accessibilityLabel = [label.text stringByAppendingString: @"Tab, 1 of 1"];
        [cell setAccessibilityLabel:accessibilityLabel];
        
    } else if(indexPath.section == DEMONSTRATIONS_SECTION_NUM) {
        
        cell = [tableView dequeueReusableCellWithIdentifier:DEMO_TITLE_IDENTIFIER forIndexPath:indexPath];
        label = (UILabel*)[cell viewWithTag:DEMO_TITLE_TAG];
        
        label.text = NSLocalizedString(@"DEMOS", nil);

    } else {
        
        cell = [tableView dequeueReusableCellWithIdentifier:STORY_IDENTIFIER forIndexPath:indexPath];
    
        label = (UILabel*)[cell viewWithTag:STORY_LABEL_TAG];
        image = (UIImageView*)[cell viewWithTag:STORY_IMAGE_TAG];
    
        UIViewController* viewController = [_viewControllers objectAtIndex:indexPath.row];
        label.text = viewController.title;
        [image setImage:[UIImage imageNamed:label.text]];
        
        //setting accessibility label
        NSString* demoTab = [NSString stringWithFormat:@", Demonstrations Tab, %d of", indexPath.row + 1];
        NSString* accessibilityLabel = [label.text stringByAppendingString:demoTab];
        accessibilityLabel = [accessibilityLabel stringByAppendingString:[NSString stringWithFormat:@"%d", [_viewControllers count]]];
        
        [cell setAccessibilityLabel:accessibilityLabel];
        
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if(indexPath.section == INTRODUCTION_SECTION_NUM) {
    
        UIViewController* viewController = _introduction;
        [self.splitViewController showDetailViewController:viewController sender:nil];
        [self observeDarkenColorsSetting];

    } else if(indexPath.section == LIST_OF_DEMOS_SECTION_NUM) {
        
        UIViewController* viewController = [_viewControllers objectAtIndex:indexPath.row];
        [self.splitViewController showDetailViewController:viewController sender:nil];
        [self observeDarkenColorsSetting];
        
    }
}

-(void)observeSwitchState {
    [self setState:overlaySwitch.on];
}

-(void)toggleState {
    [self setState:!overlaySwitch.on];
    
}

-(void)setState:(BOOL)value {
    overlaySwitch.on = value;
    [sightImage setImage:[IACViewController getSightedIcon:value]];
    [IACViewController setOverlayOn:value];
}

-(void)observeDarkenColorsSetting  {
    
    DARKEN_COLORS = UIAccessibilityDarkerSystemColorsEnabled();
    self.tableView.backgroundColor = DARKEN_COLORS ? _colorMenuBackgroundDarkened : _colorMenuBackground;
    self.wrapperView.backgroundColor = DARKEN_COLORS ? _colorMenuBackgroundDarkened : _colorMenuBackground;
    self.logoView.backgroundColor = DARKEN_COLORS ? _colorMenuBackgroundDarkened : _colorMenuBackground;
    
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

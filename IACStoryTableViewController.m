//
//  IACStoryTableTableViewController.m
//  Accessibility 101
//
//  Created by Chris McMeeking on 4/14/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import "IACStoryTableViewController.h"
#import "IACNavigationController.h"
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
#define INTRO_LABEL_TAG 100
#define INTRO_IMAGE_TAG 99
#define DEMO_TITLE_TAG 90
#define STORY_LABEL_TAG 101
#define STORY_IMAGE_TAG 110

@implementation IACStoryTableViewController {
    NSArray* _viewControllers;
    UIViewController* _introduction;
    UISwitch* overlaySwitch;
    
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
    [self observeDarkenColorsSetting];
}

- (void)viewWillAppear:(BOOL) animated {
    [super viewWillAppear:animated];
    [self setState];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section == 3) {
        return _viewControllers.count;
    } else {
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell* cell;
    UILabel* label;
    UIImageView* image;
    DARKEN_COLORS = UIAccessibilityDarkerSystemColorsEnabled();
    
    if(indexPath.section == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:OVERLAY_IDENTIFIER forIndexPath:indexPath];
        self.sightImage = (UIImageView*)[cell viewWithTag:OVERLAY_IMAGE_TAG];
        overlaySwitch = (UISwitch*)[cell viewWithTag:OVERLAY_SWITCH_TAG];
        
        [overlaySwitch addTarget:self action:@selector(changeState) forControlEvents:UIControlEventValueChanged];
        
    } else if(indexPath.section == 1) {
        cell = [tableView dequeueReusableCellWithIdentifier:INTRODUCTION_IDENTIFIER forIndexPath:indexPath];
        label = (UILabel*)[cell viewWithTag:INTRO_LABEL_TAG];
        image = (UIImageView*)[cell viewWithTag:INTRO_IMAGE_TAG];
        
        label.text = _introduction.title;
        label.textColor = DARKEN_COLORS ? _colorCellTextDimmedDarkened : _colorCellTextDimmed;
        [image setImage:[UIImage imageNamed:label.text]];
        
    } else if(indexPath.section == 2) {
        
        cell = [tableView dequeueReusableCellWithIdentifier:DEMO_TITLE_IDENTIFIER forIndexPath:indexPath];
        label = (UILabel*)[cell viewWithTag:DEMO_TITLE_TAG];
        
        label.text = NSLocalizedString(@"DEMOS", nil);

    } else {
        cell = [tableView dequeueReusableCellWithIdentifier:STORY_IDENTIFIER forIndexPath:indexPath];
    
        label = (UILabel*)[cell viewWithTag:STORY_LABEL_TAG];
        image = (UIImageView*)[cell viewWithTag:STORY_IMAGE_TAG];
    
        UIViewController* viewController = [_viewControllers objectAtIndex:indexPath.row];
        label.text = viewController.title;
        label.textColor = DARKEN_COLORS ? _colorCellTextDimmedDarkened : _colorCellTextDimmed;
        [image setImage:[UIImage imageNamed:label.text]];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = DARKEN_COLORS ? _colorCellBackgroundDimmedDarkened : _colorCellBackgroundDimmed;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if(indexPath.section == 1) {
        
        UIViewController* viewController = _introduction;
        [self.splitViewController showDetailViewController:viewController sender:nil];
        [self observeDarkenColorsSetting];
        
    } else if(indexPath.section == 3) {
        
        UIViewController* viewController = [_viewControllers objectAtIndex:indexPath.row];
        [self.splitViewController showDetailViewController:viewController sender:nil];
        [self observeDarkenColorsSetting];
        
    }
}

-(void)setState {
    if(overlayOn) {
        [self.sightImage setImage:[UIImage imageNamed:@"DequeU_app_icon_unsighted"]];
        [overlaySwitch setOn:YES animated:YES];
    } else {
        [self.sightImage setImage:[UIImage imageNamed:@"DequeU_app_icon_sighted"]];
        [overlaySwitch setOn:NO animated:YES];
    }
}

-(void)changeState {
    if(overlaySwitch.on) {
        [self.sightImage setImage:[UIImage imageNamed:@"DequeU_app_icon_unsighted"]];
        overlayOn = YES;
    } else {
        [self.sightImage setImage:[UIImage imageNamed:@"DequeU_app_icon_sighted"]];
        overlayOn = NO;
    }
}

-(void)observeDarkenColorsSetting  {
    
    DARKEN_COLORS = UIAccessibilityDarkerSystemColorsEnabled();
    self.tableView.backgroundColor = DARKEN_COLORS ? _colorMenuBackgroundDarkened : _colorMenuBackground;
    self.logoView.backgroundColor = DARKEN_COLORS ? _colorMenuBackgroundDarkened: _colorMenuBackground;
    self.label.textColor = DARKEN_COLORS ? _colorCellTextDimmedDarkened : _colorCellTextDimmed;
    
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

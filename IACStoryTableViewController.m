//
//  IACStoryTableTableViewController.m
//  Accessibility 101
//
//  Created by Chris McMeeking on 4/14/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import "IACStoryTableViewController.h"
#import "IACViewController.h"
#import "IACConstants.h"
#import "IACUtilities.h"

#define OVERLAY_IDENTIFIER @"Overlay"
#define INTRODUCTION_IDENTIFIER @"Introduction"
#define BASIC_DEMO_TITLE_IDENTIFIER @"BasicDemos"
#define BASIC_STORY_IDENTIFIER @"BasicStoryCell"
#define ADV_DEMO_TITLE_IDENTIFIER @"AdvDemos"
#define ADV_STORY_IDENTIFIER @"AdvStoryCell"

#define OVERLAY_IMAGE_TAG 93
#define OVERLAY_SWITCH_TAG 92
#define DEMO_TITLE_TAG 90
#define STORY_LABEL_TAG 101
#define STORY_IMAGE_TAG 110

#define OVERLAY_SECTION_NUM 0
#define INTRODUCTION_SECTION_NUM 1
#define BASIC_DEMOS_SECTION_NUM 2
#define BASIC_DEMO_STORIES_SECTION_NUM 3
#define ADV_DEMOS_SECTION_NUM 4
#define ADV_DEMO_STORIES_SECTION_NUM 5

@implementation IACStoryTableViewController {
    NSArray* _viewControllersBasic;
    NSArray* _viewControllersAdvanced;
    UIViewController* _introduction;
    UISwitch* overlaySwitch;
    UIImageView* sightImage;
    
    ///< color scheme
    UIColor* _colorCellText;
    UIColor* _colorMenuBackground;
    UIColor* _colorCellBackgroundDimmed;
    UIColor* _colorCellBackgroundSelected;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ///< silencing constraint error
    self.tableView.rowHeight = 44;
    
    self.tableView.delegate = self;
    self.clearsSelectionOnViewWillAppear = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    UIStoryboard* storyBoard = [UIStoryboard storyboardWithName:@"Storyboard" bundle:nil];
    NSMutableArray* basicDemos = [NSMutableArray array];
    NSMutableArray* advancedDemos = [NSMutableArray array];
    
    _introduction = [storyBoard instantiateViewControllerWithIdentifier:@"Introduction"];
    [basicDemos addObject:[storyBoard instantiateViewControllerWithIdentifier:@"LabelStory"]];
    [basicDemos addObject:[storyBoard instantiateViewControllerWithIdentifier:@"HintStory"]];
    [basicDemos addObject:[storyBoard instantiateViewControllerWithIdentifier:@"TraitStory"]];
    [basicDemos addObject:[storyBoard instantiateViewControllerWithIdentifier:@"NestedA11yStory"]];
    [basicDemos addObject:[storyBoard instantiateViewControllerWithIdentifier:@"DynamicTypeStory"]];
    
    UIStoryboard* dynamic = [UIStoryboard storyboardWithName:@"DynamicNotifications" bundle:nil];
    [basicDemos addObject:[dynamic instantiateViewControllerWithIdentifier:@"DynamicNotifications"]];
    
    UIStoryboard* form = [UIStoryboard storyboardWithName:@"FormsValidation" bundle:nil];
    [advancedDemos addObject:[form instantiateViewControllerWithIdentifier:@"FormsValidation"]];
    
    UIStoryboard* modal = [UIStoryboard storyboardWithName:@"ModalDialog" bundle:nil];
    [basicDemos addObject:[modal instantiateViewControllerWithIdentifier:@"ModalDialog"]];
    
    ///< only load this story into the menu if user uses an iPad
    if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
    {
        UIStoryboard* colors = [UIStoryboard storyboardWithName:@"TopBarContrast" bundle:nil];
        [basicDemos addObject:[colors instantiateViewControllerWithIdentifier:@"TopBarContrast"]];
    }
    
    _viewControllersBasic = [NSArray arrayWithArray:basicDemos];
    _viewControllersAdvanced = [NSArray arrayWithArray:advancedDemos];
    
    ///< colors
    _colorCellText = [IACUtilities colorWithHexString:DARK_BLUE];
    _colorMenuBackground = [IACUtilities colorWithHexString:DQ_COLOR_WORLDSPACE_WHITE];
    _colorCellBackgroundDimmed = [IACUtilities colorWithHexString:DQ_COLOR_WORLDSPACE_WHITE];
    _colorCellBackgroundSelected = [IACUtilities colorWithHexString:LIGHT_BLUE];
    
    ///< set color scheme
    [[UINavigationBar appearance] setTitleTextAttributes: @{NSForegroundColorAttributeName: [IACUtilities colorWithHexString:BLUE]}];
    self.tableView.backgroundColor = _colorMenuBackground;
    self.wrapperView.backgroundColor = _colorMenuBackground;
    self.logoView.backgroundColor = _colorMenuBackground;
    
    self.tableView.backgroundView = nil;
    
    ///< selecting introduction cell
    NSIndexPath* indexPath = [NSIndexPath indexPathForRow:0 inSection:1];
    [self.tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionBottom];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self setState:NO];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 6;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if(section == BASIC_DEMO_STORIES_SECTION_NUM) {
        return _viewControllersBasic.count;
        
    } else if(section == ADV_DEMO_STORIES_SECTION_NUM) {
        return _viewControllersAdvanced.count;
        
    } else {
        return 1;
        
    }
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if(indexPath.section == OVERLAY_SECTION_NUM) {
        [self toggleState];
        
        return nil;
        
    } else if(indexPath.section == BASIC_DEMOS_SECTION_NUM || indexPath.section == ADV_DEMOS_SECTION_NUM) {
        return nil;

    } else {
        return indexPath;
        
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell* cell;
    UILabel* label;
    
    if(indexPath.section == OVERLAY_SECTION_NUM) {
        
        cell = [tableView dequeueReusableCellWithIdentifier:OVERLAY_IDENTIFIER forIndexPath:indexPath];
        sightImage = (UIImageView*)[cell viewWithTag:OVERLAY_IMAGE_TAG];
        overlaySwitch = (UISwitch*)[cell viewWithTag:OVERLAY_SWITCH_TAG];
        
        ///< creating overlaySwitch
        [overlaySwitch addTarget:self action:@selector(observeSwitchState) forControlEvents:UIControlEventValueChanged];
        
        ///< setting accessibility hint
        [cell setAccessibilityHint:NSLocalizedString(@"TOGGLE_SETTING_HINT", nil)];
        
    } else if(indexPath.section == INTRODUCTION_SECTION_NUM) {
        
        NSArray* array = [[NSArray alloc] initWithObjects:_introduction, nil];
        cell = [self createTableViewCellFromArray:array withIdentifier:INTRODUCTION_IDENTIFIER forIndexPath:indexPath];
        
    } else if(indexPath.section == BASIC_DEMOS_SECTION_NUM) {
        
        cell = [tableView dequeueReusableCellWithIdentifier:BASIC_DEMO_TITLE_IDENTIFIER forIndexPath:indexPath];
        label = (UILabel*)[cell viewWithTag:DEMO_TITLE_TAG];
        
        label.text = NSLocalizedString(@"BASIC_DEMOS", nil);
        label.accessibilityLabel = NSLocalizedString(@"BASIC_DEMOS", nil);
        
    } else if(indexPath.section == ADV_DEMOS_SECTION_NUM) {
        
        cell = [tableView dequeueReusableCellWithIdentifier:ADV_DEMO_TITLE_IDENTIFIER forIndexPath:indexPath];
        label = (UILabel*)[cell viewWithTag:DEMO_TITLE_TAG];
        
        label.text = NSLocalizedString(@"ADV_DEMOS", nil);
        label.accessibilityLabel = NSLocalizedString(@"ADV_DEMOS", nil);
        
    } else if(indexPath.section == BASIC_DEMO_STORIES_SECTION_NUM) {
        
        cell = [self createTableViewCellFromArray:_viewControllersBasic withIdentifier:BASIC_STORY_IDENTIFIER forIndexPath:indexPath];

    } else {
        
        cell = [self createTableViewCellFromArray:_viewControllersAdvanced withIdentifier:ADV_STORY_IDENTIFIER forIndexPath:indexPath];

    }
    
    UIView* selectedView = [[UIView alloc] init];
    selectedView.backgroundColor = _colorCellBackgroundSelected;
    cell.selectedBackgroundView = selectedView;
    cell.backgroundColor = _colorCellBackgroundDimmed;
    label.textColor = _colorCellText;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if(indexPath.section == INTRODUCTION_SECTION_NUM) {
        UIViewController* viewController = _introduction;
        [self.splitViewController showDetailViewController:viewController sender:nil];

    } else if(indexPath.section == BASIC_DEMO_STORIES_SECTION_NUM) {
        
        UIViewController* viewController = [_viewControllersBasic objectAtIndex:indexPath.row];
        [self.splitViewController showDetailViewController:viewController sender:nil];
 
    } else if(indexPath.section == ADV_DEMO_STORIES_SECTION_NUM) {
        
        UIViewController* viewController = [_viewControllersAdvanced objectAtIndex:indexPath.row];
        [self.splitViewController showDetailViewController:viewController sender:nil];
        
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

-(UITableViewCell*)createTableViewCellFromArray:(NSArray*)viewControllers withIdentifier:(NSString*)identifier forIndexPath:(NSIndexPath*)indexPath {
    UITableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    UILabel* label = (UILabel*)[cell viewWithTag:STORY_LABEL_TAG];
    UIImageView* image = (UIImageView*)[cell viewWithTag:STORY_IMAGE_TAG];
    
    UIViewController* viewController = [viewControllers objectAtIndex:indexPath.row];
    label.text = viewController.title;
    [image setImage:[UIImage imageNamed:label.text]];
    
    ///< setting accessibility label
    NSString* demoTab;
    
    if([identifier isEqual: INTRODUCTION_IDENTIFIER]) {
        demoTab = @"Tab,";
    } else if([identifier isEqual: BASIC_STORY_IDENTIFIER]) {
        demoTab = @", Basic Demonstrations Tab,";
    } else {
        demoTab = @", Advanced Demonstrations Tab,";
    }
    demoTab = [demoTab stringByAppendingString: [NSString stringWithFormat: @"%d of", indexPath.row + 1]];
    
    NSString* accessibilityLabel = [label.text stringByAppendingString:demoTab];
    accessibilityLabel = [accessibilityLabel stringByAppendingString:[NSString stringWithFormat:@"%d", [viewControllers count]]];
    cell.accessibilityLabel = accessibilityLabel;
    
    return cell;
}

@end

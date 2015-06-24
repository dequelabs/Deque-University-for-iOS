//
//  CustomIOS7AlertView.m
//  CustomIOS7AlertView
//
//  Created by Richard on 20/09/2013. Modified by Quentin Rousseau on 31/10/2013.
//  Copyright (c) 2013 Wimagguc.
//
//  Lincesed under The MIT License (MIT)
//  http://opensource.org/licenses/MIT
//

#import "CustomIOS7AlertView.h"
#import <QuartzCore/QuartzCore.h>
#import <DQA11y/DQA11y.h>
#import "IACSplitViewController.h"


#define kCustomIOS7DefaultButtonColor [UIColor colorWithRed:67.0f/255.0f green:67.0f/255.0f blue:67.0f/255.0f alpha:1.0f]

const static CGFloat kCustomIOS7AlertViewDefaultButtonHeight       = 50;
const static CGFloat kCustomIOS7AlertViewDefaultButtonSpacerHeight = 1;
const static CGFloat kCustomIOS7AlertViewCornerRadius              = 0;
const static CGFloat kCustomIOS7MotionEffectExtent                 = 10.0;

static UIView* _overlayViewForModal;

@implementation CustomIOS7AlertView

CGFloat buttonHeight = 0;
CGFloat buttonSpacerHeight = 0;

@synthesize parentView, containerView, dialogView, buttonView, onButtonTouchUpInside;
@synthesize delegate;
@synthesize buttonTitles;
@synthesize buttonColors;
@synthesize useMotionEffects;

- (id)initWithParentView: (UIView *)_parentView
{
    self = [super init];
    if (self) {

        if (_parentView) {
            self.frame = _parentView.frame;
            parentView = _parentView;
        } else {
            self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        }

        delegate = self;
        useMotionEffects = false;
        buttonTitles = @[@"Close"];
        buttonColors = @[kCustomIOS7DefaultButtonColor];
        
        UIViewController* _overlayViewController = [[UIStoryboard storyboardWithName:@"Storyboard" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"Overlay"];
        
        _overlayViewController.view.accessibilityElementsHidden = YES;
        _overlayViewForModal = _overlayViewController.view;
    }
    return self;
}

- (id)init
{
    return [self initWithParentView:NULL];
}

// Create the dialog view, and animate opening the dialog
- (void)show
{
    dialogView = [self createContainerView];
  
    dialogView.layer.shouldRasterize = YES;
    dialogView.layer.rasterizationScale = [[UIScreen mainScreen] scale];
  
    self.layer.shouldRasterize = YES;
    self.layer.rasterizationScale = [[UIScreen mainScreen] scale];

#if (defined(__IPHONE_7_0))
    if (useMotionEffects) {
        [self applyMotionEffects];
    }
#endif

    dialogView.layer.opacity = 0.5f;
    dialogView.layer.transform = CATransform3DMakeScale(1.3f, 1.3f, 1.0);

    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];

    [self addSubview:dialogView];

    // Can be attached to a view or to the top most window
    // Attached to a view:
    if (parentView != NULL) {
        [parentView addSubview:self];

    // Attached to the top most window (make sure we are using the right orientation):
    } else {
        UIInterfaceOrientation interfaceOrientation = [[UIApplication sharedApplication] statusBarOrientation];

        switch (interfaceOrientation) {
            case UIInterfaceOrientationLandscapeLeft:
                self.transform = CGAffineTransformMakeRotation(M_PI * 270.0 / 180.0);
                break;
                
            case UIInterfaceOrientationLandscapeRight:
                self.transform = CGAffineTransformMakeRotation(M_PI * 90.0 / 180.0);
                break;

            case UIInterfaceOrientationPortraitUpsideDown:
                self.transform = CGAffineTransformMakeRotation(M_PI * 180.0 / 180.0);
                break;

            default:
                break;
        }

        [self setFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        [[[[UIApplication sharedApplication] windows] lastObject] addSubview:self];
    }

    [UIView animateWithDuration:0.2f delay:0.0 options:UIViewAnimationOptionCurveEaseInOut
					 animations:^{
						 self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4f];
                         dialogView.layer.opacity = 1.0f;
                         dialogView.layer.transform = CATransform3DMakeScale(1, 1, 1);
					 }
					 completion:NULL
     ];
    
    [self addSubview:_overlayViewForModal];
    
    if([IACSplitViewController overlayIsOn]) {
        _overlayViewForModal.hidden = NO;
    } else {
        _overlayViewForModal.hidden = YES;
    }
}
+ (CustomIOS7AlertView *) alertWithTitle:(NSString *)title message:(NSString *)message
{
  CustomIOS7AlertView* alertView = [[CustomIOS7AlertView alloc] init];
  
  UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, alertView.bounds.size.width - 40, 100)];
  
  // Add some custom content to the alert view
  UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, view.bounds.size.width - 40, 100)];
  titleLabel.text = title;
  titleLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
  titleLabel.textAlignment = NSTextAlignmentCenter;
  [titleLabel sizeToFit];
  
  CGRect frame = titleLabel.frame;
  frame.size.width =  view.bounds.size.width - 40;
  titleLabel.frame = frame;
  
  [view addSubview:titleLabel];
  
  // Add some custom content to the alert view
  UILabel *messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, titleLabel.frame.origin.y + titleLabel.frame.size.height + 10, view.bounds.size.width - 40, 100)];

  messageLabel.numberOfLines = 0;
  messageLabel.text = message;
  messageLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  messageLabel.textAlignment = NSTextAlignmentCenter;
  [messageLabel sizeToFit];
  
  CGRect frame2 = messageLabel.frame;
  frame2.size.width =  view.bounds.size.width - 40;
  messageLabel.frame = frame2;
  
  [view addSubview:messageLabel];
  
  CGRect frame3 = view.frame;
  frame3.size.height = titleLabel.bounds.size.height + messageLabel.bounds.size.height + 30;
  view.frame = frame3;
  
  [alertView setContainerView:view];
  
  [alertView setUseMotionEffects:true];
  
  return alertView;
}

// Button has touched
- (IBAction)customIOS7dialogButtonTouchUpInside:(id)sender
{
    if (delegate != NULL) {
        [delegate customIOS7dialogButtonTouchUpInside:self clickedButtonAtIndex:[sender tag]];
    }

    if (onButtonTouchUpInside != NULL) {
        onButtonTouchUpInside(self, [sender tag]);
    }
}

// Default button behaviour
- (void)customIOS7dialogButtonTouchUpInside: (CustomIOS7AlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [self close];
}

// Dialog close animation then cleaning and removing the view from the parent
- (void)close
{
    dialogView.layer.transform = CATransform3DMakeScale(1, 1, 1);
    dialogView.layer.opacity = 1.0f;

    [UIView animateWithDuration:0.2f delay:0.0 options:UIViewAnimationOptionTransitionNone
					 animations:^{
						 self.backgroundColor = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.0f];
                         dialogView.layer.transform = CATransform3DMakeScale(0.6f, 0.6f, 1.0);
                         dialogView.layer.opacity = 0.0f;
					 }
					 completion:^(BOOL finished) {
                         for (UIView *v in [self subviews]) {
                             [v removeFromSuperview];
                         }
                         [self removeFromSuperview];
					 }
	 ];
    [_overlayViewForModal removeFromSuperview];
}

- (void)setSubView: (UIView *)subView
{
    containerView = subView;
}

// Creates the container view here: create the dialog, then add the custom content and buttons
- (UIView *)createContainerView
{
    if ([buttonTitles count] > 0) {
        buttonHeight       = kCustomIOS7AlertViewDefaultButtonHeight;
        buttonSpacerHeight = kCustomIOS7AlertViewDefaultButtonSpacerHeight;
    } else {
        buttonHeight = 0;
        buttonSpacerHeight = 0;
    }

    if (containerView == NULL) {
        containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 150)];
    }

    CGFloat dialogWidth = containerView.frame.size.width;
    CGFloat dialogHeight = containerView.frame.size.height + (buttonHeight + buttonSpacerHeight) * [buttonTitles count] ;

    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;

    UIInterfaceOrientation interfaceOrientation = [[UIApplication sharedApplication] statusBarOrientation];
    if (UIInterfaceOrientationIsLandscape(interfaceOrientation)) {
        CGFloat tmp = screenWidth;
        screenWidth = screenHeight;
        screenHeight = tmp;
    }

    // For the black background
    [self setFrame:CGRectMake(0, 0, screenWidth, screenHeight)];

    // This is the dialog's container; we attach the custom content and the buttons to this one
    UIView *dialogContainer = [[UIView alloc] initWithFrame:CGRectMake((screenWidth - dialogWidth) / 2, (screenHeight - dialogHeight) / 2, dialogWidth, dialogHeight)];

    // First, we style the dialog to match the iOS7 UIAlertView >>>
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = dialogContainer.bounds;
    gradient.colors = [NSArray arrayWithObjects:
                       (id)[[UIColor colorWithRed:218.0/255.0 green:218.0/255.0 blue:218.0/255.0 alpha:1.0f] CGColor],
                       (id)[[UIColor colorWithRed:233.0/255.0 green:233.0/255.0 blue:233.0/255.0 alpha:1.0f] CGColor],
                       (id)[[UIColor colorWithRed:218.0/255.0 green:218.0/255.0 blue:218.0/255.0 alpha:1.0f] CGColor],
                       nil];

    CGFloat cornerRadius = kCustomIOS7AlertViewCornerRadius;
    gradient.cornerRadius = cornerRadius;
    [dialogContainer.layer insertSublayer:gradient atIndex:0];

    dialogContainer.layer.cornerRadius = cornerRadius;
    dialogContainer.layer.borderColor = [[UIColor colorWithRed:198.0/255.0 green:198.0/255.0 blue:198.0/255.0 alpha:1.0f] CGColor];
    dialogContainer.layer.borderWidth = 1;
    dialogContainer.layer.shadowRadius = cornerRadius + 5;
    dialogContainer.layer.shadowOpacity = 0.1f;
    dialogContainer.layer.shadowOffset = CGSizeMake(0 - (cornerRadius+5)/2, 0 - (cornerRadius+5)/2);
    dialogContainer.layer.shadowColor = [UIColor blackColor].CGColor;
    dialogContainer.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:dialogContainer.bounds cornerRadius:dialogContainer.layer.cornerRadius].CGPath;

    // Add the custom container if there is any
    [dialogContainer addSubview:containerView];

    // Add the buttons too
    [self addButtonsToView:dialogContainer];

    return dialogContainer;
}

- (void)addButtonsToView: (UIView *)container
{
    for (int i = 0; i < [buttonTitles count]; i++)
    {
        UIButton *closeButton = [UIButton buttonWithType:UIButtonTypeCustom];

        [closeButton setFrame:CGRectMake(0, container.bounds.size.height - ([buttonTitles count] - i) * (buttonHeight + buttonSpacerHeight), self.containerView.bounds.size.width, buttonHeight)];

        [closeButton addTarget:self action:@selector(customIOS7dialogButtonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
        [closeButton setTag:i];
        [closeButton setTitle:[buttonTitles objectAtIndex:i] forState:UIControlStateNormal];
      
        if([buttonColors count] > i && [buttonColors objectAtIndex:i])
             [closeButton setBackgroundColor:[buttonColors objectAtIndex:i]];
        else [closeButton setBackgroundColor:kCustomIOS7DefaultButtonColor];
      
        [closeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [closeButton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        [closeButton.titleLabel setFont:[UIFont boldSystemFontOfSize:16.0f]];
        [closeButton.layer setCornerRadius:kCustomIOS7AlertViewCornerRadius];

        [container addSubview:closeButton];
    }
}

+ (void)setOverlay: (BOOL)overlayIsOn {
    _overlayViewForModal.hidden = !overlayIsOn;
}

#if (defined(__IPHONE_7_0))
// Add motion effects
- (void)applyMotionEffects {

    if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1) {
        return;
    }

    UIInterpolatingMotionEffect *horizontalEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x"
                                                                                                    type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    horizontalEffect.minimumRelativeValue = @(-kCustomIOS7MotionEffectExtent);
    horizontalEffect.maximumRelativeValue = @( kCustomIOS7MotionEffectExtent);

    UIInterpolatingMotionEffect *verticalEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y"
                                                                                                  type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
    verticalEffect.minimumRelativeValue = @(-kCustomIOS7MotionEffectExtent);
    verticalEffect.maximumRelativeValue = @( kCustomIOS7MotionEffectExtent);

    UIMotionEffectGroup *motionEffectGroup = [[UIMotionEffectGroup alloc] init];
    motionEffectGroup.motionEffects = @[horizontalEffect, verticalEffect];

    [dialogView addMotionEffect:motionEffectGroup];
}
#endif

@end
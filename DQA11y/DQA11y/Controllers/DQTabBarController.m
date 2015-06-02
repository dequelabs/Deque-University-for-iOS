//
//  DQTabBarController.m
//  Accessibility 101
//
//  Created by Chris McMeeking on 4/14/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import "DQTabBarController.h"

@interface DQTabBarController ()

@end

@implementation DQTabBarController{
    UIColor* _colorDimmed;
    UIColor* _colorSelected;
    UIColor* _colorDimmedDarkened;
    UIColor* _colorSelectedDarkened;
    UIColor* _colorTabBar;
    UIColor* _colorTabBarDarkened;
    BOOL _translucentDarkened;
    BOOL _translucentUndarkened;
}

@dynamic colorDimmed;
@dynamic colorSelected;
@dynamic colorDimmedDarkened;
@dynamic colorSelectedDarkened;
@dynamic colorTabBar;
@dynamic colorTabBarDarkened;
@dynamic translucentDarkened;
@dynamic translucentUndarkened;

/**
 * ????
 */
+ (UIImage*)tintImage:(UIImage*)image withColor:(UIColor*)tintColor {
    UIGraphicsBeginImageContextWithOptions(image.size, NO, [[UIScreen mainScreen] scale]);
    CGRect drawRect = CGRectMake(0, 0, image.size.width, image.size.height);
    [image drawInRect:drawRect];
    [tintColor set];
    UIRectFillUsingBlendMode(drawRect, kCGBlendModeSourceAtop);
    UIImage *tintedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return [tintedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /**
     * Listener for when "Darken Colors" option is changed
     */
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(observeDarkenColorsSetting)
                                                 name:UIAccessibilityDarkerSystemColorsStatusDidChangeNotification
                                               object:nil];
    
    _colorSelected = [UIColor blackColor];
    _colorSelectedDarkened = [UIColor blackColor];
    _colorDimmed = [UIColor blueColor];
    _colorDimmedDarkened = [UIColor blueColor];
    _colorTabBar = [UIColor grayColor];
    _colorTabBarDarkened = [UIColor grayColor];
    _translucentDarkened = NO;
    _translucentUndarkened = YES;
    
    [self observeDarkenColorsSetting];
}

/**
 * Changes the colors and translucency of the tab bar according to the variables set.
 * This gets called when the "Darken Colors" setting is changed.
 */
-(void)observeDarkenColorsSetting {
    
    BOOL DARKEN_COLORS = UIAccessibilityDarkerSystemColorsEnabled();
    
    UIColor* colorDimmed = DARKEN_COLORS ? _colorDimmedDarkened : _colorDimmed;
    UIColor* colorSelected = DARKEN_COLORS ? _colorSelectedDarkened : _colorSelected;
    UIColor* tabBarColor = DARKEN_COLORS ? _colorTabBarDarkened : _colorTabBar;
    BOOL tabBarTranslucent = DARKEN_COLORS ? _translucentDarkened : _translucentUndarkened;
    
    for (UITabBarItem* tabBarItem in self.tabBar.items) {
        UIImage* image = tabBarItem.image;
        tabBarItem.image = [self.class tintImage:image withColor:colorDimmed];
        tabBarItem.selectedImage = [self.class tintImage:image withColor:colorSelected];
    }
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Bold" size:10.0f],
                                                        NSForegroundColorAttributeName : colorSelected
                                                        } forState:UIControlStateSelected];
    
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Bold" size:10.0f],
                                                        NSForegroundColorAttributeName : colorDimmed
                                                        } forState:UIControlStateNormal];
    
    self.tabBar.barTintColor = tabBarColor;
    self.tabBar.translucent = tabBarTranslucent;
}

/**
 * Dyanmic Property Definitions.  We must define setters dynamically, otherwise the value
 * Could be set, without it updating the UI accordingly.
 */
- (void)setColorDimmed:(UIColor *)colorDimmed {
    _colorDimmed = colorDimmed;
    
    [self observeDarkenColorsSetting];
}

- (UIColor*)colorDimmed {
    return _colorDimmed;
}

- (void)setColorSelected:(UIColor *)colorSelected {
    _colorSelected = colorSelected;
    
    [self observeDarkenColorsSetting];
}

- (UIColor*)colorSelected {
    return _colorSelected;
}

- (void)setColorSelectedDarkened:(UIColor *)colorSelectedDarkened {
    _colorSelectedDarkened = colorSelectedDarkened;
    
    [self observeDarkenColorsSetting];
}

- (UIColor*)colorSelectedDarkened {
    return _colorSelectedDarkened;
}

- (void)setColorDimmedDarkened:(UIColor *)colorDimmedDarkened {
    _colorDimmedDarkened = colorDimmedDarkened;
    
    [self observeDarkenColorsSetting];
}

- (UIColor*)colorDimmedDarkened {
    return _colorDimmedDarkened;
}

- (void)setColorTabBar:(UIColor *)colorTabBar {
    _colorTabBar = colorTabBar;
    
    [self observeDarkenColorsSetting];
}

- (UIColor*)colorTabBar {
    return _colorTabBar;
}

- (void)setColorTabBarDarkened:(UIColor *)colorTabBarDarkened {
    _colorTabBarDarkened = colorTabBarDarkened;
    
    [self observeDarkenColorsSetting];
}

- (UIColor*)colorTabBarDarkened {
    return _colorTabBarDarkened;
}

- (void)setTranslucentDarkened:(BOOL)translucentDarkened {
    _translucentDarkened = translucentDarkened;
    
    [self observeDarkenColorsSetting];
}

- (BOOL)translucentDarkened {
    return _translucentDarkened;
}

- (void)setTranslucentUndarkened:(BOOL)translucentUndarkened {
    _translucentUndarkened = translucentUndarkened;
    
    [self observeDarkenColorsSetting];
}

- (BOOL)translucentUndarkened {
    return _translucentUndarkened;
}

/**
 * Returns a UIColor given a hex code
 */
-(UIColor*)colorWithHexString:(NSString*)hex {
    
    NSString *cString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    //! String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor grayColor];
    
    //! strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    
    if ([cString length] != 6) return  [UIColor grayColor];
    
    //! Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    //! Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}

@end

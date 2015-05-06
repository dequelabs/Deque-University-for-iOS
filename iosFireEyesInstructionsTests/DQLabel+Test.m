//
//  DQLabel+Test.m
//  Accessibility 101
//
//  Created by Meng Du on 5/1/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import "DQLabel+Test.h"


@implementation IACLabelBrokenViewController (test)

- (UIButton*) dogDisplay { return _DogDisplay; }
- (UIButton*) catDisplay { return _CatDisplay; }
- (UIButton*) fishDisplay { return _FishDisplay; }
- (UIImageView*) imageView { return _ImageView; }

@end



@implementation IACLabelFixedViewController (test)

- (UIButton*) dogDisplay { return _DogDisplay; }
- (UIButton*) catDisplay { return _CatDisplay; }
- (UIButton*) fishDisplay { return _FishDisplay; }
- (UIImageView*) imageView { return _ImageView; }

@end
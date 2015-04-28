//
//  DQLabel+Test.m
//  Accessibility 101
//
//  Created by Meng Du on 4/9/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import "DQLabel+Test.h"

@implementation DQLabelExampleViewController (test)

- (UILabel*) exampleLabel { return _ExampleLabel; }
- (UILabel*) dogLabel { return _DogLabel; }
- (UILabel*) catLabel { return _CatLabel; }
- (UILabel*) fishLabel { return _FishLabel; }
- (UIButton*) dogDisplay { return _DogDisplay; }
- (UIButton*) catDisplay { return _CatDisplay; }
- (UIButton*) fishDisplay { return _FishDisplay; }
- (UITextView*) textView { return _TextView; }
- (UIImageView*) imageView { return _ImageView; }

@end



@implementation DQBrokenLabelViewController (test)

- (UILabel*) brokenLabel { return _BrokenLabel; }
- (UIButton*) dogDisplay { return _DogDisplay; }
- (UIButton*) catDisplay { return _CatDisplay; }
- (UIButton*) fishDisplay { return _FishDisplay; }
- (UITextView*) textView { return _TextView; }
- (UIImageView*) imageView { return _ImageView; }

@end



@implementation IACLabelFixedViewController (test)

- (UIButton*) dogDisplay { return _DogDisplay; }
- (UIButton*) catDisplay { return _CatDisplay; }
- (UIButton*) fishDisplay { return _FishDisplay; }
- (UIImageView*) imageView { return _ImageView; }

@end
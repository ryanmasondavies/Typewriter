//
//  UIKBTree.h
//  Typewriter
//
//  Created by Ryan Davies on 30/10/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIKBTree : NSObject

@property (readonly) CGRect frame;
@property (readonly) NSString *representedString;
@property (readonly) NSArray *keys;
@property (readonly) BOOL isShiftKeyplane;

@end

//
//  TWRPressSpaceCommand.m
//  Typewriter
//
//  Created by Ryan Davies on 30/10/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import "TWRPressSpaceCommand.h"
#import "UIApplication+TWRKeyboard.h"

@implementation TWRPressSpaceCommand

- (UIKBTree *)key
{
    __block UIKBTree *key = nil;
    NSArray *keys = [[[[UIApplication sharedApplication] keyplaneView] keyplane] keys];
    [keys enumerateObjectsUsingBlock:^(UIKBTree *node, NSUInteger idx, BOOL *stop) {
        if ([[node representedString] isEqualToString:@" "]) {
            key = node;
            *stop = YES;
        }
    }];
    
    return key;
}

@end

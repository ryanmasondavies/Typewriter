//
//  TWREnterCharacterCommand.m
//  Typewriter
//
//  Created by Ryan Davies on 30/10/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import "TWREnterCharacterCommand.h"
#import "UIApplication+TWRKeyboard.h"

@implementation TWREnterCharacterCommand

- (UIKBTree *)key
{
    NSString *string = [NSString stringWithFormat:@"%C", [self character]];
    UIKBKeyplaneView *keyplaneView = [[UIApplication sharedApplication] keyplaneView];
    NSArray *keys = [[keyplaneView keyplane] keys];
    
    __block UIKBTree *key = nil;
    [keys enumerateObjectsUsingBlock:^(UIKBTree *node, NSUInteger idx, BOOL *stop) {
        if ([[node representedString] isEqualToString:string]) {
            key = node;
            *stop = YES;
        }
    }];
    
    return key;
}

@end

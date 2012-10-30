//
//  TWRTypingCommand.m
//  Typewriter
//
//  Created by Ryan Davies on 30/10/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import "TWRTypingCommand.h"
#import "UIApplication+TWRKeyboard.h"
#import <Handsy/UIView+HDYGestures.h>

@implementation TWRTypingCommand

- (UIKBTree *)key
{
    return nil;
}

- (void)execute
{
    UIKBTree *key = [self key];
    if (key) {
        CGPoint keyCenter = (CGPoint){CGRectGetMidX([key frame]), CGRectGetMidY([key frame])};
        [[[UIApplication sharedApplication] keyplaneView] tapAtPosition:keyCenter];
        CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.8, NO);
    }
}

@end

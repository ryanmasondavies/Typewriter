//
//  TWRTypist.m
//  Typewriter
//
//  Created by Ryan Davies on 29/10/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import "TWRTypist.h"
#import "TWREnterCharacterCommand.h"
#import "TWRPressShiftCommand.h"

@implementation TWRTypist

- (void)executeCommand:(TWRTypingCommand *)command
{
    [command execute];
    CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.2f, NO);
}

- (void)enterString:(NSString *)string
{
    for (NSUInteger index = 0; index < [string length]; index ++) {
        unichar character = [string characterAtIndex:index];
        
        if ([[NSCharacterSet uppercaseLetterCharacterSet] characterIsMember:character])
            [self executeCommand:[TWRPressShiftCommand new]];
        
        [self executeCommand:[[TWREnterCharacterCommand alloc] initWithCharacter:character]];
    }
}

@end

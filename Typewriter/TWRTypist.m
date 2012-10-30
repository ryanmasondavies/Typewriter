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
#import "TWRPressSpaceCommand.h"

@implementation TWRTypist

- (id)init
{
    self = [super init];
    if (self) {
        self.stack = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)enterString:(NSString *)string
{
    for (NSUInteger index = 0; index < [string length]; index ++) {
        unichar character = [string characterAtIndex:index];
        
        if ([[NSCharacterSet uppercaseLetterCharacterSet] characterIsMember:character]) {
            [[self stack] addObject:[TWRPressShiftCommand new]];
        }
        
        if (character == ' ') {
            [[self stack] addObject:[TWRPressSpaceCommand new]];
        } else {
            TWREnterCharacterCommand *enterCharacter = [[TWREnterCharacterCommand alloc] init];
            [enterCharacter setCharacter:character];
            [[self stack] addObject:enterCharacter];
        }
    }
    
    [[self stack] enumerateObjectsUsingBlock:^(TWRTypingCommand *command, NSUInteger idx, BOOL *stop) {
        [command execute];
        CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.05f, NO);
    }];
}

@end

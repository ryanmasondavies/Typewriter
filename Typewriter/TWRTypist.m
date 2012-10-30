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

- (void)enterString:(NSString *)string
{
    NSMutableArray *commandStack = [NSMutableArray array];
    
    for (NSUInteger index = 0; index < [string length]; index ++) {
        unichar character = [string characterAtIndex:index];
        
        if ([[NSCharacterSet uppercaseLetterCharacterSet] characterIsMember:character]) {
            [commandStack addObject:[TWRPressShiftCommand new]];
        }
        
        if (character == ' ') {
            [commandStack addObject:[TWRPressSpaceCommand new]];
        } else {
            TWREnterCharacterCommand *enterCharacter = [[TWREnterCharacterCommand alloc] init];
            [enterCharacter setCharacter:character];
            [commandStack addObject:enterCharacter];
        }
    }
    
    [commandStack enumerateObjectsUsingBlock:^(TWRTypingCommand *command, NSUInteger idx, BOOL *stop) {
        [command execute];
    }];
}

@end

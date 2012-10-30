//
//  TWRTypist.m
//  Typewriter
//
//  Created by Ryan Davies on 29/10/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import "TWRTypist.h"
#import <Handsy/UIView+HDYGestures.h>
#import "UIApplication+TWRKeyboard.h"
#import "UIKBTree.h"

@implementation TWRTypist

- (void)enterString:(NSString *)string
{
    unichar character;
    UIKBKeyplaneView *keyboardView = [[UIApplication sharedApplication] keyplaneView];
    UIKBTree *keyplane = [keyboardView keyplane];
    
    for (NSUInteger index = 0; index < [string length]; index ++) {
        character = [string characterAtIndex:index];
        
        NSString *representedString = [NSString stringWithCharacters:(const unichar *)&character length:1];
        BOOL isUppercase = [[NSCharacterSet uppercaseLetterCharacterSet] characterIsMember:character];
        
        if (isUppercase && ([keyplane isShiftKeyplane] == NO)) {
            // The keyboard stores its represented strings as lowercase, regardless of the shift status:
            representedString = [representedString lowercaseString];
            
            // Find the shift key:
            __block UIKBTree *shiftKey = nil;
            [[keyplane keys] enumerateObjectsUsingBlock:^(UIKBTree *node, NSUInteger idx, BOOL *stop) {
                if ([[node representedString] isEqualToString:@"Shift"]) {
                    shiftKey = node;
                    *stop = YES;
                }
            }];
            
            CGPoint keyCenter = (CGPoint){CGRectGetMidX([shiftKey frame]), CGRectGetMidY([shiftKey frame])};
            [keyboardView tapAtPosition:keyCenter];
        }
        
        __block UIKBTree *key = nil;
        [[keyplane keys] enumerateObjectsUsingBlock:^(UIKBTree *node, NSUInteger idx, BOOL *stop) {
            if ([[node representedString] isEqualToString:representedString]) {
                NSLog(@"%@ matches %@", representedString, [node representedString]);
                key = node;
                *stop = YES;
            }
        }];
        
        if (key) {
            CGPoint keyCenter = (CGPoint){CGRectGetMidX([key frame]), CGRectGetMidY([key frame])};
            [keyboardView tapAtPosition:keyCenter];
        }
    }
}

@end

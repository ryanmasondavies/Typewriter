//
//  TWRTypistSpec.m
//  Typewriter
//
//  Created by Ryan Davies on 29/10/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import "TWRSpecHelper.h"
#import "TWRTypist.h"
#import "TWREnterCharacterCommand.h"
#import "TWRPressSpaceCommand.h"
#import "TWRPressShiftCommand.h"

SpecBegin(TWRTypist)

it(@"should add enter character commands for each letter in the string", ^{
    TWRTypist *typist = [[TWRTypist alloc] init];
    NSMutableArray *stack = [[NSMutableArray alloc] init];
    [typist setStack:stack];
    
    [typist enterString:@"hello"];
    
    expect(stack).to.haveCountOf(5);
    
    unichar expected[5] = {'h', 'e', 'l', 'l', 'o'};
    for (NSUInteger i = 0; i < 5; i ++) {
        expect([stack objectAtIndex:i]).to.beKindOf([TWREnterCharacterCommand class]);
        expect([[stack objectAtIndex:i] character]).to.equal(expected[i]);
    }
});

it(@"should add space character commands for each space in the string", ^{
    TWRTypist *typist = [[TWRTypist alloc] init];
    NSMutableArray *stack = [[NSMutableArray alloc] init];
    [typist setStack:stack];
    
    [typist enterString:@"hello world"];
    
    expect(stack).to.haveCountOf(11);
    expect([stack objectAtIndex:5]).to.beKindOf([TWRPressSpaceCommand class]);
});

it(@"should add a command for pressing the shift button before every uppercase letter in the string", ^{
    TWRTypist *typist = [[TWRTypist alloc] init];
    NSMutableArray *stack = [[NSMutableArray alloc] init];
    [typist setStack:stack];
    
    [typist enterString:@"Hello World"];
    
    expect(stack).to.haveCountOf(13);
    expect([stack objectAtIndex:0]).to.beKindOf([TWRPressShiftCommand class]);
    expect([stack objectAtIndex:7]).to.beKindOf([TWRPressShiftCommand class]);
});

SpecEnd

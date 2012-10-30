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

@interface TWRTestCommand : TWRTypingCommand
@property (nonatomic, getter = wasExecuted) BOOL executed;
@end

@implementation TWRTestCommand

- (void)execute
{
    self.executed = YES;
}

@end

SpecBegin(TWRTypist)

it(@"should add enter character commands for each letter in the string", ^{
    TWRTypist *typist = [[TWRTypist alloc] init];
    
    NSMutableArray *stack = [[NSMutableArray alloc] init];
    [typist setStack:stack];
    
    [typist enterString:@"hello"];
    
    expect([stack[0] character]).to.equal('h');
    expect([stack[1] character]).to.equal('e');
    expect([stack[2] character]).to.equal('l');
    expect([stack[3] character]).to.equal('l');
    expect([stack[4] character]).to.equal('o');
});

it(@"should add space character commands for each space in the string", ^{
    TWRTypist *typist = [[TWRTypist alloc] init];
    
    NSMutableArray *stack = [[NSMutableArray alloc] init];
    [typist setStack:stack];
    
    [typist enterString:@"hello world"];
    
    expect([stack[0] character]).to.equal('h');
    expect([stack[1] character]).to.equal('e');
    expect([stack[2] character]).to.equal('l');
    expect([stack[3] character]).to.equal('l');
    expect([stack[4] character]).to.equal('o');
    expect(stack[5]).to.beKindOf([TWRPressSpaceCommand class]);
    expect([stack[6] character]).to.equal('w');
    expect([stack[7] character]).to.equal('o');
    expect([stack[8] character]).to.equal('r');
    expect([stack[9] character]).to.equal('l');
    expect([stack[10] character]).to.equal('d');
});

it(@"should add a command for pressing the shift button before every uppercase letter in the string", ^{
    TWRTypist *typist = [[TWRTypist alloc] init];
    
    NSMutableArray *stack = [[NSMutableArray alloc] init];
    [typist setStack:stack];
    
    [typist enterString:@"Hello World"];
    
    expect(stack[0]).to.beKindOf([TWRPressShiftCommand class]);
    expect([stack[1] character]).to.equal('H');
    expect([stack[2] character]).to.equal('e');
    expect([stack[3] character]).to.equal('l');
    expect([stack[4] character]).to.equal('l');
    expect([stack[5] character]).to.equal('o');
    expect(stack[6]).to.beKindOf([TWRPressSpaceCommand class]);
    expect(stack[7]).to.beKindOf([TWRPressShiftCommand class]);
    expect([stack[8] character]).to.equal('W');
    expect([stack[9] character]).to.equal('o');
    expect([stack[10] character]).to.equal('r');
    expect([stack[11] character]).to.equal('l');
    expect([stack[12] character]).to.equal('d');
});

it(@"should execute all commands in the stack", ^{
    TWRTypist *typist = [[TWRTypist alloc] init];
    
    NSMutableArray *stack = [[NSMutableArray alloc] init];
    [stack addObject:[TWRTestCommand new]];
    [stack addObject:[TWRTestCommand new]];
    [stack addObject:[TWRTestCommand new]];
    [typist setStack:stack];
    
    [typist enterString:@"hello"];
    
    expect([stack[0] wasExecuted]).to.beTruthy();
    expect([stack[1] wasExecuted]).to.beTruthy();
    expect([stack[2] wasExecuted]).to.beTruthy();
});

SpecEnd

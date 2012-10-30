//
//  TWRPressSpaceCommand.m
//  Typewriter
//
//  Created by Ryan Davies on 30/10/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import "TWRSpecHelper.h"
#import "TWRPressSpaceCommand.h"

SpecBegin(TWRPressSpaceCommand)

__block TWRTestViewController *viewController;
__block TWRPressSpaceCommand *pressSpaceCommand;

before(^{
    viewController = [[TWRTestViewController alloc] init];
    pressSpaceCommand = [[TWRPressSpaceCommand alloc] init];
    [[[UIApplication sharedApplication] keyWindow] setRootViewController:viewController];
    [[viewController textField] becomeFirstResponder];
});

it(@"should enter a space character", ^{
    [pressSpaceCommand execute];
    expect([[viewController textField] text]).to.equal(@" ");
});

after(^{
    [[[UIApplication sharedApplication] keyWindow] setRootViewController:nil];
});

SpecEnd

//
//  TWRTypingSpec.m
//  Typewriter
//
//  Created by Ryan Davies on 29/10/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import "TWRSpecHelper.h"
#import "TWRTypist.h"

SpecBegin(TWRTyping)

__block TWRTestViewController *viewController;

before(^{
    viewController = [[TWRTestViewController alloc] init];
    [[[UIApplication sharedApplication] keyWindow] setRootViewController:viewController];
    [[viewController textField] setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    [[viewController textField] becomeFirstResponder];
});

it(@"should enter the text 'Hello World'", ^{
    TWRTypist *typist = [[TWRTypist alloc] init];
    [typist enterString:@"Hello World"];
    expect([[viewController textField] text]).to.equal(@"Hello World");
});

SpecEnd

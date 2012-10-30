//
//  TWRTypistSpec.m
//  Typewriter
//
//  Created by Ryan Davies on 29/10/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import "TWRSpecHelper.h"
#import "TWRTypist.h"

SpecBegin(TWRTypist)

__block TWRTestViewController *viewController;
__block TWRTypist *typist;

before(^{
    viewController = [[TWRTestViewController alloc] init];
    typist = [[TWRTypist alloc] init];
});

describe(@"when the keyboard is in lowercase", ^{
    before(^{
        [[[UIApplication sharedApplication] keyWindow] setRootViewController:viewController];
        [[viewController textField] setAutocapitalizationType:UITextAutocapitalizationTypeNone];
        [[viewController textField] becomeFirstResponder];
    });
    
    it(@"should type lowercase keys", ^{
        [typist enterString:@"hello"];
        expect([[viewController textField] text]).to.equal(@"hello");
    });
    
    it(@"should type spaces", ^{
        [typist enterString:@" "];
        expect([[viewController textField] text]).to.equal(@" ");
    });
    
    it(@"should type uppercase letters", ^{
        [typist enterString:@"HELLO"];
        expect([[viewController textField] text]).to.equal(@"HELLO");
    });
});

SpecEnd

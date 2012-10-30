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

__block UIViewController *viewController;
__block UITextField *textField;
__block TWRTypist *typist;

before(^{
    viewController = [[UIViewController alloc] init];
    
    textField = [[UITextField alloc] init];
    [textField setFrame:CGRectMake(32, 32, 128, 24)];
    [[viewController view] addSubview:textField];
    
    typist = [[TWRTypist alloc] init];
});

describe(@"when the keyboard is in lowercase", ^{
    before(^{
        [textField setAutocapitalizationType:UITextAutocapitalizationTypeNone];
        [textField setAutocorrectionType:UITextAutocorrectionTypeNo];
        [[[UIApplication sharedApplication] keyWindow] setRootViewController:viewController];
        [textField becomeFirstResponder];
    });
    
    it(@"should type lowercase keys", ^{
        [typist enterString:@"hello"];
        expect([textField text]).to.equal(@"hello");
    });
    
    it(@"should type spaces", ^{
        [typist enterString:@" "];
        expect([textField text]).to.equal(@" ");
    });
    
    it(@"should type uppercase letters", ^{
        [typist enterString:@"HELLO"];
        expect([textField text]).to.equal(@"HELLO");
    });
});

SpecEnd

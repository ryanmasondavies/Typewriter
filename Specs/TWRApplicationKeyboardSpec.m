//
//  TWRApplicationKeyboardSpec.m
//  Typewriter
//
//  Created by Ryan Davies on 29/10/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import "TWRSpecHelper.h"
#import "UIApplication+TWRKeyboard.h"

SpecBegin(TWRApplicationKeyboard)

__block TWRTestViewController *viewController;

before(^{
    viewController = [[TWRTestViewController alloc] init];
    [[[UIApplication sharedApplication] keyWindow] setRootViewController:viewController];
});

it(@"should return the keyboard view when the keyboard is displayed", ^{
    [[viewController textField] becomeFirstResponder];
    
    UIKBKeyplaneView *keyboardView = [[UIApplication sharedApplication] keyplaneView];
    expect(keyboardView).toNot.beNil();
});

it(@"should return nil when they keyboard is not displayed", ^{
    UIKBKeyplaneView *keyboardView = [[UIApplication sharedApplication] keyplaneView];
    expect(keyboardView).to.beNil();
});

after(^{
    [[[UIApplication sharedApplication] keyWindow] setRootViewController:nil];
});

SpecEnd

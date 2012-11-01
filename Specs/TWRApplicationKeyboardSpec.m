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

it(@"should return the keyboard view when the keyboard is displayed", ^{
    UIViewController *viewController = [[UIViewController alloc] init];
    [[[UIApplication sharedApplication] keyWindow] setRootViewController:viewController];
    
    UITextField *textField = [[UITextField alloc] init];
    [textField setFrame:[[viewController view] frame]];
    [[viewController view] addSubview:textField];
    [textField becomeFirstResponder];
    
    expect([[UIApplication sharedApplication] keyplaneView]).toNot.beNil();
});

it(@"should return nil when they keyboard is not displayed", ^{
    expect([[UIApplication sharedApplication] keyplaneView]).to.beNil();
});

after(^{
    [[[UIApplication sharedApplication] keyWindow] setRootViewController:nil];
});

SpecEnd

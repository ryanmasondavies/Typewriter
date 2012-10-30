//
//  TWRApplicationKeyboardSpec.m
//  Typewriter
//
//  Created by Ryan Davies on 29/10/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import "TWRSpecHelper.h"
#import "UIApplication+TWRKeyboard.h"
#import <Handsy/UIView+HDYGestures.h>

SpecBegin(TWRApplicationKeyboard)

describe(@"-keyboardView", ^{
    it(@"should return the keyboard view when the keyboard is displayed", ^{
        UIViewController *viewController = [[UIViewController alloc] init];
        
        UITextField *textField = [[UITextField alloc] init];
        [textField setFrame:CGRectMake(32, 32, 128, 24)];
        [[viewController view] addSubview:textField];
        
        [[[UIApplication sharedApplication] keyWindow] setRootViewController:viewController];
        
        [textField becomeFirstResponder];
        
        UIKBKeyplaneView *keyboardView = [[UIApplication sharedApplication] keyplaneView];
        expect(keyboardView).toNot.beNil();
    });
    
    it(@"should return nil when they keyboard is not displayed", ^{
        UIViewController *viewController = [[UIViewController alloc] init];
        
        UITextField *textField = [[UITextField alloc] init];
        [textField setFrame:CGRectMake(32, 32, 128, 24)];
        [[viewController view] addSubview:textField];
        
        [[[UIApplication sharedApplication] keyWindow] setRootViewController:viewController];
        
        UIKBKeyplaneView *keyboardView = [[UIApplication sharedApplication] keyplaneView];
        expect(keyboardView).to.beNil();
    });
});

SpecEnd

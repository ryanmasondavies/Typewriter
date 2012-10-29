//
//  TWRApplicationKeyboard.m
//  Typewriter
//
//  Created by Ryan Davies on 29/10/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import "TWRSpecHelper.h"
#import "UIApplication+TWRKeyboard.h"
#import "TWRKeyboard.h"

SpecBegin(TWRApplicationKeyboard)

describe(@"-keyboard", ^{
    it(@"should return the keyboard when displayed", ^{
        UIViewController *viewController = [[UIViewController alloc] init];
        
        UITextField *textField = [[UITextField alloc] init];
        [textField setFrame:CGRectMake(32, 32, 128, 24)];
        [[viewController view] addSubview:textField];
        
        [[[UIApplication sharedApplication] keyWindow] setRootViewController:viewController];
        
        [textField becomeFirstResponder];
        
        TWRKeyboard *keyboard = [[UIApplication sharedApplication] keyboard];
        expect([keyboard view]).to.beKindOf(NSClassFromString(@"UIKeyboardAutomatic"));
    });
    
    it(@"should return nil when they keyboard is not displayed", ^{
        UIViewController *viewController = [[UIViewController alloc] init];
        
        UITextField *textField = [[UITextField alloc] init];
        [textField setFrame:CGRectMake(32, 32, 128, 24)];
        [[viewController view] addSubview:textField];
        
        [[[UIApplication sharedApplication] keyWindow] setRootViewController:viewController];
        
        TWRKeyboard *keyboard = [[UIApplication sharedApplication] keyboard];
        expect([keyboard view]).to.beNil();
    });
});

SpecEnd

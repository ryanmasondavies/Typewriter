//
//  TWRPressShiftCommandSpec.m
//  Typewriter
//
//  Created by Ryan Davies on 30/10/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import "TWRSpecHelper.h"
#import "TWRPressShiftCommand.h"
#import "UIApplication+TWRKeyboard.h"

SpecBegin(TWRPressShiftCommand)

__block TWRTestViewController *viewController;

before(^{
    viewController = [[TWRTestViewController alloc] init];
    [[[UIApplication sharedApplication] keyWindow] setRootViewController:viewController];
});

it(@"should change the keyboard to display lowercase keys when the keyboard is displaying uppercase keys", ^{
    [[viewController textField] setAutocapitalizationType:UITextAutocapitalizationTypeAllCharacters];
    [[viewController textField] becomeFirstResponder];
    
    expect([[[[UIApplication sharedApplication] keyplaneView] keyplane] isShiftKeyplane]).to.beTruthy();
    [[TWRPressShiftCommand new] execute];
    expect([[[[UIApplication sharedApplication] keyplaneView] keyplane] isShiftKeyplane]).to.beFalsy();
});

it(@"should change the keyboard to display uppercase keys when the keyboard is displaying lowercase keys", ^{
    [[viewController textField] setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    [[viewController textField] becomeFirstResponder];
    
    expect([[[[UIApplication sharedApplication] keyplaneView] keyplane] isShiftKeyplane]).to.beFalsy();
    [[TWRPressShiftCommand new] execute];
    expect([[[[UIApplication sharedApplication] keyplaneView] keyplane] isShiftKeyplane]).to.beTruthy();
});

SpecEnd

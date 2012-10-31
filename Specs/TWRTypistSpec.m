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

before(^{
    viewController = [[TWRTestViewController alloc] init];
    [[[UIApplication sharedApplication] keyWindow] setRootViewController:viewController];
});

context(@"using the ASCII-capable keyboard type", ^{
    before(^{
        [[viewController textField] setKeyboardType:UIKeyboardTypeASCIICapable];
    });
    
    context(@"in lowercase", ^{
        before(^{
            [[viewController textField] setAutocapitalizationType:UITextAutocapitalizationTypeNone];
            [[viewController textField] becomeFirstResponder];
        });
        
        it(@"should enter lowercase characters", ^{
            TWRTypist *typist = [[TWRTypist alloc] init];
            [typist enterString:@"hello"];
            expect([[viewController textField] text]).to.equal(@"hello");
        });
        
        it(@"should enter uppercase characters", ^{
            TWRTypist *typist = [[TWRTypist alloc] init];
            [typist enterString:@"HELLO"];
            expect([[viewController textField] text]).to.equal(@"HELLO");
        });
        
        it(@"should enter a combination of uppercase and lowercase characters", ^{
            TWRTypist *typist = [[TWRTypist alloc] init];
            [typist enterString:@"hElLoWoRlD"];
            expect([[viewController textField] text]).to.equal(@"hElLoWoRlD");
        });
        
        it(@"should enter space characters", ^{
            TWRTypist *typist = [[TWRTypist alloc] init];
            [typist enterString:@"Hello world"];
            expect([[viewController textField] text]).to.equal(@"Hello world");
        });
        
        it(@"should enter number characters", ^{
            TWRTypist *typist = [[TWRTypist alloc] init];
            [typist enterString:@"0123456789"];
            expect([[viewController textField] text]).to.equal(@"0123456789");
        });
        
        it(@"should enter special characters", ^{
            // -/:;()£&@".,?!'
            // []{}#%^*+=_\|~<>€$¥•
        });
    });
    
    context(@"in uppercase", ^{
        it(@"should enter lowercase characters", ^{
            // 'hello'
        });
        
        it(@"should enter uppercase characters", ^{
            // 'HELLO'
        });
        
        it(@"should enter a combination of uppercase and lowercase characters", ^{
            // 'hElLoWoRlD'
        });
        
        it(@"should enter space characters", ^{
            // 'hello world'
        });
        
        it(@"should enter special characters", ^{
            // -/:;()£&@".,?!'
            // []{}#%^*+=_\|~<>€$¥•
        });
    });
});

SpecEnd

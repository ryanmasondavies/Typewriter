//
//  TWRTypistSpec.m
//  Typewriter
//
//  Created by Ryan Davies on 29/10/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import "TWRSpecHelper.h"
#import "TWRTypist.h"

NSString * const kLowercaseCharacters = @"abcdefghijklmnopqrstuvwxyz";
NSString * const kUppercaseCharacters = @"ABCDEFGHIJKLMNOPQRSTUVWXYZ";
NSString * const kNumericalCharacters = @"0123456789";
NSString * const kPunctuationCharacters = @".,:;\"?!'-";
NSString * const kSpecialCharacters = @"/()£&@[]{}#%^*+=_\\|~<>€$¥•";

SpecBegin(TWRTypist)

NSString * (^stringByMergingStrings)(NSArray *strings) = ^(NSArray *strings) {
    __block NSUInteger maxLength = 0;
    [strings enumerateObjectsUsingBlock:^(NSString *string, NSUInteger idx, BOOL *stop) {
        if ([string length] > maxLength) maxLength = [string length];
    }];
    
    NSMutableString *result = [NSMutableString string];
    for (NSUInteger i = 0; i < maxLength; i ++) {
        [strings enumerateObjectsUsingBlock:^(NSString *string, NSUInteger idx, BOOL *stop) {
            if (i < [string length]) [result appendFormat:@"%C", [string characterAtIndex:i]];
        }];
    }
    
    return [NSString stringWithString:result];
};

__block TWRTestViewController *viewController;
__block TWRTypist *typist;

before(^{
    viewController = [[TWRTestViewController alloc] init];
    typist = [[TWRTypist alloc] init];
    [[[UIApplication sharedApplication] keyWindow] setRootViewController:viewController];
});

context(@"using the ASCII keyboard type", ^{
    before(^{
        [[viewController textField] setKeyboardType:UIKeyboardTypeASCIICapable];
        [[viewController textField] becomeFirstResponder];
    });
    
    it(@"should enter space characters", ^{
        BOOL result = [typist enterString:@" "];
        expect(result).to.beTruthy();
        expect([[viewController textField] text]).to.equal(@" ");
    });
    
    context(@"in lowercase", ^{
        before(^{
            [[viewController textField] setAutocapitalizationType:UITextAutocapitalizationTypeNone];
        });
        
        it(@"should enter lowercase characters", ^{
            BOOL result = [typist enterString:kLowercaseCharacters];
            expect(result).to.beTruthy();
            expect([[viewController textField] text]).to.equal(kLowercaseCharacters);
        });
        
        it(@"should enter uppercase characters", ^{
            BOOL result = [typist enterString:kUppercaseCharacters];
            expect(result).to.beTruthy();
            expect([[viewController textField] text]).to.equal(kUppercaseCharacters);
        });
        
        it(@"should enter number characters", ^{
            BOOL result = [typist enterString:kNumericalCharacters];
            expect(result).to.beTruthy();
            expect([[viewController textField] text]).to.equal(kNumericalCharacters);
        });
        
        it(@"should enter punctuation characters", ^{
            BOOL result = [typist enterString:kPunctuationCharacters];
            expect(result).to.beTruthy();
            expect([[viewController textField] text]).to.equal(kPunctuationCharacters);
        });
        
        it(@"should enter special characters", ^{
            BOOL result = [typist enterString:kSpecialCharacters];
            expect(result).to.beTruthy();
            expect([[viewController textField] text]).to.equal(kSpecialCharacters);
        });
        
        it(@"should enter combinations of lowercase and uppercase characters", ^{
            NSString *string = stringByMergingStrings(@[kLowercaseCharacters, kUppercaseCharacters]);
            BOOL result = [typist enterString:string];
            expect(result).to.beTruthy();
            expect([[viewController textField] text]).to.equal(string);
        });
        
        it(@"should enter combinations of lowercase and numerical characters", ^{
            NSString *string = stringByMergingStrings(@[kLowercaseCharacters, kNumericalCharacters]);
            BOOL result = [typist enterString:string];
            expect(result).to.beTruthy();
            expect([[viewController textField] text]).to.equal(string);
        });
        
        it(@"should enter combinations of lowercase and punctuation characters", ^{
            NSString *string = stringByMergingStrings(@[kLowercaseCharacters, kPunctuationCharacters]);
            BOOL result = [typist enterString:string];
            expect(result).to.beTruthy();
            expect([[viewController textField] text]).to.equal(string);
        });
        
        it(@"should enter combinations of lowercase and special characters", ^{
            NSString *string = stringByMergingStrings(@[kLowercaseCharacters, kSpecialCharacters]);
            BOOL result = [typist enterString:string];
            expect(result).to.beTruthy();
            expect([[viewController textField] text]).to.equal(string);
        });
        
        it(@"should enter combinations of uppercase and numerical characters", ^{
            NSString *string = stringByMergingStrings(@[kUppercaseCharacters, kNumericalCharacters]);
            BOOL result = [typist enterString:string];
            expect(result).to.beTruthy();
            expect([[viewController textField] text]).to.equal(string);
        });
        
        it(@"should enter combinations of uppercase and punctuation characters", ^{
            NSString *string = stringByMergingStrings(@[kUppercaseCharacters, kPunctuationCharacters]);
            BOOL result = [typist enterString:string];
            expect(result).to.beTruthy();
            expect([[viewController textField] text]).to.equal(string);
        });
        
        it(@"should enter combinations of uppercase and special characters", ^{
            NSString *string = stringByMergingStrings(@[kUppercaseCharacters, kSpecialCharacters]);
            BOOL result = [typist enterString:string];
            expect(result).to.beTruthy();
            expect([[viewController textField] text]).to.equal(string);
        });
        
        it(@"should enter combinations of numerical and punctuation characters", ^{
            NSString *string = stringByMergingStrings(@[kNumericalCharacters, kPunctuationCharacters]);
            BOOL result = [typist enterString:string];
            expect(result).to.beTruthy();
            expect([[viewController textField] text]).to.equal(string);
        });
        
        it(@"should enter combinations of numerical and special characters", ^{
            NSString *string = stringByMergingStrings(@[kNumericalCharacters, kSpecialCharacters]);
            BOOL result = [typist enterString:string];
            expect(result).to.beTruthy();
            expect([[viewController textField] text]).to.equal(string);
        });
        
        it(@"should enter combinations of punctuation and special characters", ^{
            NSString *string = stringByMergingStrings(@[kPunctuationCharacters, kSpecialCharacters]);
            BOOL result = [typist enterString:string];
            expect(result).to.beTruthy();
            expect([[viewController textField] text]).to.equal(string);
        });
    });
});

SpecEnd

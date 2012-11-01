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

before(^{
    viewController = [[TWRTestViewController alloc] init];
    [[[UIApplication sharedApplication] keyWindow] setRootViewController:viewController];
});

context(@"when using the ASCII keyboard type in lowercase", ^{
    before(^{
        [[viewController textView] setKeyboardType:UIKeyboardTypeASCIICapable];
        [[viewController textView] setAutocapitalizationType:UITextAutocapitalizationTypeNone];
        [[viewController textView] becomeFirstResponder];
    });
    
    it(@"should enter space characters", ^{
        BOOL result = [TWRTypist typeString:@" "];
        expect(result).to.beTruthy();
        expect([[viewController textView] text]).to.equal(@" ");
    });
    
    it(@"should enter lowercase characters", ^{
        BOOL result = [TWRTypist typeString:kLowercaseCharacters];
        expect(result).to.beTruthy();
        expect([[viewController textView] text]).to.equal(kLowercaseCharacters);
    });
    
    it(@"should enter uppercase characters", ^{
        expect([TWRTypist typeString:kUppercaseCharacters]).to.beTruthy();
        expect([[viewController textView] text]).to.equal(kUppercaseCharacters);
    });
    
    it(@"should enter number characters", ^{
        BOOL result = [TWRTypist typeString:kNumericalCharacters];
        expect(result).to.beTruthy();
        expect([[viewController textView] text]).to.equal(kNumericalCharacters);
    });
    
    it(@"should enter punctuation characters", ^{
        BOOL result = [TWRTypist typeString:kPunctuationCharacters];
        expect(result).to.beTruthy();
        expect([[viewController textView] text]).to.equal(kPunctuationCharacters);
    });
    
    it(@"should enter special characters", ^{
        BOOL result = [TWRTypist typeString:kSpecialCharacters];
        expect(result).to.beTruthy();
        expect([[viewController textView] text]).to.equal(kSpecialCharacters);
    });
    
    it(@"should enter combinations of lowercase and uppercase characters", ^{
        NSString *string = stringByMergingStrings(@[kLowercaseCharacters, kUppercaseCharacters]);
        BOOL result = [TWRTypist typeString:string];
        expect(result).to.beTruthy();
        expect([[viewController textView] text]).to.equal(string);
    });
    
    it(@"should enter combinations of lowercase and numerical characters", ^{
        NSString *string = stringByMergingStrings(@[kLowercaseCharacters, kNumericalCharacters]);
        BOOL result = [TWRTypist typeString:string];
        expect(result).to.beTruthy();
        expect([[viewController textView] text]).to.equal(string);
    });
    
    it(@"should enter combinations of lowercase and punctuation characters", ^{
        NSString *string = stringByMergingStrings(@[kLowercaseCharacters, kPunctuationCharacters]);
        BOOL result = [TWRTypist typeString:string];
        expect(result).to.beTruthy();
        expect([[viewController textView] text]).to.equal(string);
    });
    
    it(@"should enter combinations of lowercase and special characters", ^{
        NSString *string = stringByMergingStrings(@[kLowercaseCharacters, kSpecialCharacters]);
        BOOL result = [TWRTypist typeString:string];
        expect(result).to.beTruthy();
        expect([[viewController textView] text]).to.equal(string);
    });
    
    it(@"should enter combinations of uppercase and numerical characters", ^{
        NSString *string = stringByMergingStrings(@[kUppercaseCharacters, kNumericalCharacters]);
        BOOL result = [TWRTypist typeString:string];
        expect(result).to.beTruthy();
        expect([[viewController textView] text]).to.equal(string);
    });
    
    it(@"should enter combinations of uppercase and punctuation characters", ^{
        NSString *string = stringByMergingStrings(@[kUppercaseCharacters, kPunctuationCharacters]);
        BOOL result = [TWRTypist typeString:string];
        expect(result).to.beTruthy();
        expect([[viewController textView] text]).to.equal(string);
    });
    
    it(@"should enter combinations of uppercase and special characters", ^{
        NSString *string = stringByMergingStrings(@[kUppercaseCharacters, kSpecialCharacters]);
        BOOL result = [TWRTypist typeString:string];
        expect(result).to.beTruthy();
        expect([[viewController textView] text]).to.equal(string);
    });
    
    it(@"should enter combinations of numerical and punctuation characters", ^{
        NSString *string = stringByMergingStrings(@[kNumericalCharacters, kPunctuationCharacters]);
        BOOL result = [TWRTypist typeString:string];
        expect(result).to.beTruthy();
        expect([[viewController textView] text]).to.equal(string);
    });
    
    it(@"should enter combinations of numerical and special characters", ^{
        NSString *string = stringByMergingStrings(@[kNumericalCharacters, kSpecialCharacters]);
        BOOL result = [TWRTypist typeString:string];
        expect(result).to.beTruthy();
        expect([[viewController textView] text]).to.equal(string);
    });
    
    it(@"should enter combinations of punctuation and special characters", ^{
        NSString *string = stringByMergingStrings(@[kPunctuationCharacters, kSpecialCharacters]);
        BOOL result = [TWRTypist typeString:string];
        expect(result).to.beTruthy();
        expect([[viewController textView] text]).to.equal(string);
    });
});

context(@"when using the ASCII keyboard type in uppercase", ^{
    before(^{
        [[viewController textView] setKeyboardType:UIKeyboardTypeASCIICapable];
        [[viewController textView] setAutocapitalizationType:UITextAutocapitalizationTypeAllCharacters];
        [[viewController textView] becomeFirstResponder];
    });
    
    it(@"should enter space characters", ^{
        BOOL result = [TWRTypist typeString:@" "];
        expect(result).to.beTruthy();
        expect([[viewController textView] text]).to.equal(@" ");
    });
        
    it(@"should enter lowercase characters", ^{
        BOOL result = [TWRTypist typeString:kLowercaseCharacters];
        expect(result).to.beTruthy();
        expect([[viewController textView] text]).to.equal(kLowercaseCharacters);
    });
    
    it(@"should enter uppercase characters", ^{
        BOOL result = [TWRTypist typeString:kUppercaseCharacters];
        expect(result).to.beTruthy();
        expect([[viewController textView] text]).to.equal(kUppercaseCharacters);
    });
    
    it(@"should enter number characters", ^{
        BOOL result = [TWRTypist typeString:kNumericalCharacters];
        expect(result).to.beTruthy();
        expect([[viewController textView] text]).to.equal(kNumericalCharacters);
    });
    
    it(@"should enter punctuation characters", ^{
        BOOL result = [TWRTypist typeString:kPunctuationCharacters];
        expect(result).to.beTruthy();
        expect([[viewController textView] text]).to.equal(kPunctuationCharacters);
    });
    
    it(@"should enter special characters", ^{
        BOOL result = [TWRTypist typeString:kSpecialCharacters];
        expect(result).to.beTruthy();
        expect([[viewController textView] text]).to.equal(kSpecialCharacters);
    });
    
    it(@"should enter combinations of lowercase and uppercase characters", ^{
        NSString *string = stringByMergingStrings(@[kLowercaseCharacters, kUppercaseCharacters]);
        BOOL result = [TWRTypist typeString:string];
        expect(result).to.beTruthy();
        expect([[viewController textView] text]).to.equal(string);
    });
    
    it(@"should enter combinations of lowercase and numerical characters", ^{
        NSString *string = stringByMergingStrings(@[kLowercaseCharacters, kNumericalCharacters]);
        BOOL result = [TWRTypist typeString:string];
        expect(result).to.beTruthy();
        expect([[viewController textView] text]).to.equal(string);
    });
    
    it(@"should enter combinations of lowercase and punctuation characters", ^{
        NSString *string = stringByMergingStrings(@[kLowercaseCharacters, kPunctuationCharacters]);
        BOOL result = [TWRTypist typeString:string];
        expect(result).to.beTruthy();
        expect([[viewController textView] text]).to.equal(string);
    });
    
    it(@"should enter combinations of lowercase and special characters", ^{
        NSString *string = stringByMergingStrings(@[kLowercaseCharacters, kSpecialCharacters]);
        BOOL result = [TWRTypist typeString:string];
        expect(result).to.beTruthy();
        expect([[viewController textView] text]).to.equal(string);
    });
    
    it(@"should enter combinations of uppercase and numerical characters", ^{
        NSString *string = stringByMergingStrings(@[kUppercaseCharacters, kNumericalCharacters]);
        BOOL result = [TWRTypist typeString:string];
        expect(result).to.beTruthy();
        expect([[viewController textView] text]).to.equal(string);
    });
    
    it(@"should enter combinations of uppercase and punctuation characters", ^{
        NSString *string = stringByMergingStrings(@[kUppercaseCharacters, kPunctuationCharacters]);
        BOOL result = [TWRTypist typeString:string];
        expect(result).to.beTruthy();
        expect([[viewController textView] text]).to.equal(string);
    });
    
    it(@"should enter combinations of uppercase and special characters", ^{
        NSString *string = stringByMergingStrings(@[kUppercaseCharacters, kSpecialCharacters]);
        BOOL result = [TWRTypist typeString:string];
        expect(result).to.beTruthy();
        expect([[viewController textView] text]).to.equal(string);
    });
    
    it(@"should enter combinations of numerical and punctuation characters", ^{
        NSString *string = stringByMergingStrings(@[kNumericalCharacters, kPunctuationCharacters]);
        BOOL result = [TWRTypist typeString:string];
        expect(result).to.beTruthy();
        expect([[viewController textView] text]).to.equal(string);
    });
    
    it(@"should enter combinations of numerical and special characters", ^{
        NSString *string = stringByMergingStrings(@[kNumericalCharacters, kSpecialCharacters]);
        BOOL result = [TWRTypist typeString:string];
        expect(result).to.beTruthy();
        expect([[viewController textView] text]).to.equal(string);
    });
    
    it(@"should enter combinations of punctuation and special characters", ^{
        NSString *string = stringByMergingStrings(@[kPunctuationCharacters, kSpecialCharacters]);
        BOOL result = [TWRTypist typeString:string];
        expect(result).to.beTruthy();
        expect([[viewController textView] text]).to.equal(string);
    });
});

context(@"when displaying the return key", ^{
    before(^{
        [[viewController textView] setKeyboardType:UIKeyboardTypeASCIICapable];
        [[viewController textView] setReturnKeyType:UIReturnKeyDefault];
        [[viewController textView] becomeFirstResponder];
    });
    
    it(@"should add a newline character when pressed", ^{
        expect([TWRTypist pressReturnKey]).to.beTruthy();
        expect([[viewController textView] text]).to.equal(@"\n");
    });
});

SpecEnd

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

__block TWRTestViewController *viewController;

before(^{
    viewController = [[TWRTestViewController alloc] init];
    [[[UIApplication sharedApplication] keyWindow] setRootViewController:viewController];
});

context(@"when using the ASCII keyboard type in lowercase", ^{
    __block UITextField *textField;
    
    before(^{
        textField = [[UITextField alloc] init];
        [textField setDelegate:viewController];
        [textField setFrame:[[viewController view] frame]];
        [textField setKeyboardType:UIKeyboardTypeASCIICapable];
        [textField setAutocapitalizationType:UITextAutocapitalizationTypeNone];
        [[viewController view] addSubview:textField];
        [textField becomeFirstResponder];
    });
    
    it(@"should enter space characters", ^{
        BOOL result = [TWRTypist typeString:@" "];
        expect(result).to.beTruthy();
        expect([textField text]).to.equal(@" ");
    });
    
    it(@"should enter lowercase characters", ^{
        BOOL result = [TWRTypist typeString:kLowercaseCharacters];
        expect(result).to.beTruthy();
        expect([textField text]).to.equal(kLowercaseCharacters);
    });
    
    it(@"should enter uppercase characters", ^{
        expect([TWRTypist typeString:kUppercaseCharacters]).to.beTruthy();
        expect([textField text]).to.equal(kUppercaseCharacters);
    });
    
    it(@"should enter number characters", ^{
        BOOL result = [TWRTypist typeString:kNumericalCharacters];
        expect(result).to.beTruthy();
        expect([textField text]).to.equal(kNumericalCharacters);
    });
    
    it(@"should enter punctuation characters", ^{
        BOOL result = [TWRTypist typeString:kPunctuationCharacters];
        expect(result).to.beTruthy();
        expect([textField text]).to.equal(kPunctuationCharacters);
    });
    
    it(@"should enter special characters", ^{
        BOOL result = [TWRTypist typeString:kSpecialCharacters];
        expect(result).to.beTruthy();
        expect([textField text]).to.equal(kSpecialCharacters);
    });
    
    it(@"should enter combinations of lowercase and uppercase characters", ^{
        NSString *string = TWRStringByMergingStrings(@[kLowercaseCharacters, kUppercaseCharacters]);
        BOOL result = [TWRTypist typeString:string];
        expect(result).to.beTruthy();
        expect([textField text]).to.equal(string);
    });
    
    it(@"should enter combinations of lowercase and numerical characters", ^{
        NSString *string = TWRStringByMergingStrings(@[kLowercaseCharacters, kNumericalCharacters]);
        BOOL result = [TWRTypist typeString:string];
        expect(result).to.beTruthy();
        expect([textField text]).to.equal(string);
    });
    
    it(@"should enter combinations of lowercase and punctuation characters", ^{
        NSString *string = TWRStringByMergingStrings(@[kLowercaseCharacters, kPunctuationCharacters]);
        BOOL result = [TWRTypist typeString:string];
        expect(result).to.beTruthy();
        expect([textField text]).to.equal(string);
    });
    
    it(@"should enter combinations of lowercase and special characters", ^{
        NSString *string = TWRStringByMergingStrings(@[kLowercaseCharacters, kSpecialCharacters]);
        BOOL result = [TWRTypist typeString:string];
        expect(result).to.beTruthy();
        expect([textField text]).to.equal(string);
    });
    
    it(@"should enter combinations of uppercase and numerical characters", ^{
        NSString *string = TWRStringByMergingStrings(@[kUppercaseCharacters, kNumericalCharacters]);
        BOOL result = [TWRTypist typeString:string];
        expect(result).to.beTruthy();
        expect([textField text]).to.equal(string);
    });
    
    it(@"should enter combinations of uppercase and punctuation characters", ^{
        NSString *string = TWRStringByMergingStrings(@[kUppercaseCharacters, kPunctuationCharacters]);
        BOOL result = [TWRTypist typeString:string];
        expect(result).to.beTruthy();
        expect([textField text]).to.equal(string);
    });
    
    it(@"should enter combinations of uppercase and special characters", ^{
        NSString *string = TWRStringByMergingStrings(@[kUppercaseCharacters, kSpecialCharacters]);
        BOOL result = [TWRTypist typeString:string];
        expect(result).to.beTruthy();
        expect([textField text]).to.equal(string);
    });
    
    it(@"should enter combinations of numerical and punctuation characters", ^{
        NSString *string = TWRStringByMergingStrings(@[kNumericalCharacters, kPunctuationCharacters]);
        BOOL result = [TWRTypist typeString:string];
        expect(result).to.beTruthy();
        expect([textField text]).to.equal(string);
    });
    
    it(@"should enter combinations of numerical and special characters", ^{
        NSString *string = TWRStringByMergingStrings(@[kNumericalCharacters, kSpecialCharacters]);
        BOOL result = [TWRTypist typeString:string];
        expect(result).to.beTruthy();
        expect([textField text]).to.equal(string);
    });
    
    it(@"should enter combinations of punctuation and special characters", ^{
        NSString *string = TWRStringByMergingStrings(@[kPunctuationCharacters, kSpecialCharacters]);
        BOOL result = [TWRTypist typeString:string];
        expect(result).to.beTruthy();
        expect([textField text]).to.equal(string);
    });
});

context(@"when using the ASCII keyboard type in uppercase", ^{
    __block UITextField *textField;
    
    before(^{
        textField = [[UITextField alloc] init];
        [textField setDelegate:viewController];
        [textField setFrame:[[viewController view] frame]];
        [textField setKeyboardType:UIKeyboardTypeASCIICapable];
        [textField setAutocapitalizationType:UITextAutocapitalizationTypeAllCharacters];
        [[viewController view] addSubview:textField];
        [textField becomeFirstResponder];
    });
    
    it(@"should enter space characters", ^{
        BOOL result = [TWRTypist typeString:@" "];
        expect(result).to.beTruthy();
        expect([textField text]).to.equal(@" ");
    });
        
    it(@"should enter lowercase characters", ^{
        BOOL result = [TWRTypist typeString:kLowercaseCharacters];
        expect(result).to.beTruthy();
        expect([textField text]).to.equal(kLowercaseCharacters);
    });
    
    it(@"should enter uppercase characters", ^{
        BOOL result = [TWRTypist typeString:kUppercaseCharacters];
        expect(result).to.beTruthy();
        expect([textField text]).to.equal(kUppercaseCharacters);
    });
    
    it(@"should enter number characters", ^{
        BOOL result = [TWRTypist typeString:kNumericalCharacters];
        expect(result).to.beTruthy();
        expect([textField text]).to.equal(kNumericalCharacters);
    });
    
    it(@"should enter punctuation characters", ^{
        BOOL result = [TWRTypist typeString:kPunctuationCharacters];
        expect(result).to.beTruthy();
        expect([textField text]).to.equal(kPunctuationCharacters);
    });
    
    it(@"should enter special characters", ^{
        BOOL result = [TWRTypist typeString:kSpecialCharacters];
        expect(result).to.beTruthy();
        expect([textField text]).to.equal(kSpecialCharacters);
    });
    
    it(@"should enter combinations of lowercase and uppercase characters", ^{
        NSString *string = TWRStringByMergingStrings(@[kLowercaseCharacters, kUppercaseCharacters]);
        BOOL result = [TWRTypist typeString:string];
        expect(result).to.beTruthy();
        expect([textField text]).to.equal(string);
    });
    
    it(@"should enter combinations of lowercase and numerical characters", ^{
        NSString *string = TWRStringByMergingStrings(@[kLowercaseCharacters, kNumericalCharacters]);
        BOOL result = [TWRTypist typeString:string];
        expect(result).to.beTruthy();
        expect([textField text]).to.equal(string);
    });
    
    it(@"should enter combinations of lowercase and punctuation characters", ^{
        NSString *string = TWRStringByMergingStrings(@[kLowercaseCharacters, kPunctuationCharacters]);
        BOOL result = [TWRTypist typeString:string];
        expect(result).to.beTruthy();
        expect([textField text]).to.equal(string);
    });
    
    it(@"should enter combinations of lowercase and special characters", ^{
        NSString *string = TWRStringByMergingStrings(@[kLowercaseCharacters, kSpecialCharacters]);
        BOOL result = [TWRTypist typeString:string];
        expect(result).to.beTruthy();
        expect([textField text]).to.equal(string);
    });
    
    it(@"should enter combinations of uppercase and numerical characters", ^{
        NSString *string = TWRStringByMergingStrings(@[kUppercaseCharacters, kNumericalCharacters]);
        BOOL result = [TWRTypist typeString:string];
        expect(result).to.beTruthy();
        expect([textField text]).to.equal(string);
    });
    
    it(@"should enter combinations of uppercase and punctuation characters", ^{
        NSString *string = TWRStringByMergingStrings(@[kUppercaseCharacters, kPunctuationCharacters]);
        BOOL result = [TWRTypist typeString:string];
        expect(result).to.beTruthy();
        expect([textField text]).to.equal(string);
    });
    
    it(@"should enter combinations of uppercase and special characters", ^{
        NSString *string = TWRStringByMergingStrings(@[kUppercaseCharacters, kSpecialCharacters]);
        BOOL result = [TWRTypist typeString:string];
        expect(result).to.beTruthy();
        expect([textField text]).to.equal(string);
    });
    
    it(@"should enter combinations of numerical and punctuation characters", ^{
        NSString *string = TWRStringByMergingStrings(@[kNumericalCharacters, kPunctuationCharacters]);
        BOOL result = [TWRTypist typeString:string];
        expect(result).to.beTruthy();
        expect([textField text]).to.equal(string);
    });
    
    it(@"should enter combinations of numerical and special characters", ^{
        NSString *string = TWRStringByMergingStrings(@[kNumericalCharacters, kSpecialCharacters]);
        BOOL result = [TWRTypist typeString:string];
        expect(result).to.beTruthy();
        expect([textField text]).to.equal(string);
    });
    
    it(@"should enter combinations of punctuation and special characters", ^{
        NSString *string = TWRStringByMergingStrings(@[kPunctuationCharacters, kSpecialCharacters]);
        BOOL result = [TWRTypist typeString:string];
        expect(result).to.beTruthy();
        expect([textField text]).to.equal(string);
    });
});

context(@"when displaying the return key", ^{
    __block UITextView *textView;
    
    before(^{
        textView = [[UITextView alloc] init];
        [textView setDelegate:viewController];
        [textView setFrame:[[viewController view] frame]];
        [textView setKeyboardType:UIKeyboardTypeASCIICapable];
        [textView setReturnKeyType:UIReturnKeyDefault];
        [[viewController view] addSubview:textView];
        [textView becomeFirstResponder];
    });
    
    it(@"should add a newline character when pressed", ^{
        expect([TWRTypist pressReturnKey]).to.beTruthy();
        expect([textView text]).to.equal(@"\n");
    });
});

context(@"when displaying the Go key", ^{
    __block UITextField *textField;
    
    before(^{
        textField = [[UITextField alloc] init];
        [textField setDelegate:viewController];
        [textField setFrame:[[viewController view] frame]];
        [textField setKeyboardType:UIKeyboardTypeASCIICapable];
        [textField setReturnKeyType:UIReturnKeyGo];
        [[viewController view] addSubview:textField];
        [textField becomeFirstResponder];
    });
    
    it(@"should notify the delegate", ^{
        expect([TWRTypist pressGoKey]).to.beTruthy();
        expect([viewController wasReturnKeyPressed]).to.beTruthy();
    });
});

context(@"when displaying the Google key", ^{
    __block UITextField *textField;
    
    before(^{
        textField = [[UITextField alloc] init];
        [textField setDelegate:viewController];
        [textField setFrame:[[viewController view] frame]];
        [textField setKeyboardType:UIKeyboardTypeASCIICapable];
        [textField setReturnKeyType:UIReturnKeyGoogle];
        [[viewController view] addSubview:textField];
        [textField becomeFirstResponder];
    });
    
    it(@"should notify the delegate", ^{
        expect([TWRTypist pressGoogleKey]).to.beTruthy();
        expect([viewController wasReturnKeyPressed]).to.beTruthy();
    });
});

context(@"when displaying the Join key", ^{
    __block UITextField *textField;
    
    before(^{
        textField = [[UITextField alloc] init];
        [textField setDelegate:viewController];
        [textField setFrame:[[viewController view] frame]];
        [textField setKeyboardType:UIKeyboardTypeASCIICapable];
        [textField setReturnKeyType:UIReturnKeyJoin];
        [[viewController view] addSubview:textField];
        [textField becomeFirstResponder];
    });
    
    it(@"should notify the delegate", ^{
        expect([TWRTypist pressJoinKey]).to.beTruthy();
        expect([viewController wasReturnKeyPressed]).to.beTruthy();
    });
});

context(@"when displaying the Next key", ^{
    __block UITextField *textField;
    
    before(^{
        textField = [[UITextField alloc] init];
        [textField setDelegate:viewController];
        [textField setFrame:[[viewController view] frame]];
        [textField setKeyboardType:UIKeyboardTypeASCIICapable];
        [textField setReturnKeyType:UIReturnKeyNext];
        [[viewController view] addSubview:textField];
        [textField becomeFirstResponder];
    });
    
    it(@"should notify the delegate", ^{
        expect([TWRTypist pressNextKey]).to.beTruthy();
        expect([viewController wasReturnKeyPressed]).to.beTruthy();
    });
});

SpecEnd

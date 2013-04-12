// The MIT License
// 
// Copyright (c) 2013 Ryan Davies
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

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

when(@"writing on the ASCII keyboard", ^{
    before(^{
        [[viewController textField] setKeyboardType:UIKeyboardTypeASCIICapable];
    });
    
    context(@"in lowercase", ^{
        it(@"enters space characters", ^{
            BOOL result = [TWRTypist typeString:@" "];
            [[@(result) should] beTrue];
            [[[[viewController textField] text] should] beEqualTo:@" "];
        });
        
        it(@"enters lowercase characters", ^{
            BOOL result = [TWRTypist typeString:kLowercaseCharacters];
            [[@(result) should] beTrue];
            [[[[viewController textField] text] should] beEqualTo:kLowercaseCharacters];
        });
        
        it(@"enters uppercase characters", ^{
            [[@([TWRTypist typeString:kUppercaseCharacters]) should] beTrue];
            [[[[viewController textField] text] should] beEqualTo:kUppercaseCharacters];
        });
        
        it(@"enters number characters", ^{
            BOOL result = [TWRTypist typeString:kNumericalCharacters];
            [[@(result) should] beTrue];
            [[[[viewController textField] text] should] beEqualTo:kNumericalCharacters];
        });
        
        it(@"enters punctuation characters", ^{
            BOOL result = [TWRTypist typeString:kPunctuationCharacters];
            [[@(result) should] beTrue];
            [[[[viewController textField] text] should] beEqualTo:kPunctuationCharacters];
        });
        
        it(@"enters special characters", ^{
            BOOL result = [TWRTypist typeString:kSpecialCharacters];
            [[@(result) should] beTrue];
            [[[[viewController textField] text] should] beEqualTo:kSpecialCharacters];
        });
        
        it(@"enters combinations of spaces, lowercase, uppercase, number, punctuation, and special characters", ^{
            NSString *string = [NSString stringByInterlacingStrings:@[@" ", kLowercaseCharacters, kUppercaseCharacters, kNumericalCharacters, kPunctuationCharacters, kSpecialCharacters]];
            BOOL result = [TWRTypist typeString:string];
            [[@(result) should] beTrue];
            [[[[viewController textField] text] should] beEqualTo:string];
        });
    });

    context(@"in uppercase", ^{
        before(^{
            [[viewController textField] setAutocapitalizationType:UITextAutocapitalizationTypeAllCharacters];
        });
        
        it(@"enters space characters", ^{
            BOOL result = [TWRTypist typeString:@" "];
            [[@(result) should] beTrue];
            [[[[viewController textField] text] should] beEqualTo:@" "];
        });
            
        it(@"enters lowercase characters", ^{
            BOOL result = [TWRTypist typeString:kLowercaseCharacters];
            [[@(result) should] beTrue];
            [[[[viewController textField] text] should] beEqualTo:kLowercaseCharacters];
        });
        
        it(@"enters uppercase characters", ^{
            BOOL result = [TWRTypist typeString:kUppercaseCharacters];
            [[@(result) should] beTrue];
            [[[[viewController textField] text] should] beEqualTo:kUppercaseCharacters];
        });
        
        it(@"enters number characters", ^{
            BOOL result = [TWRTypist typeString:kNumericalCharacters];
            [[@(result) should] beTrue];
            [[[[viewController textField] text] should] beEqualTo:kNumericalCharacters];
        });
        
        it(@"enters punctuation characters", ^{
            BOOL result = [TWRTypist typeString:kPunctuationCharacters];
            [[@(result) should] beTrue];
            [[[[viewController textField] text] should] beEqualTo:kPunctuationCharacters];
        });
        
        it(@"enters special characters", ^{
            BOOL result = [TWRTypist typeString:kSpecialCharacters];
            [[@(result) should] beTrue];
            [[[[viewController textField] text] should] beEqualTo:kSpecialCharacters];
        });
        
        it(@"enters combinations of spaces, lowercase, uppercase, number, punctuation, and special characters", ^{
            NSString *string = [NSString stringByInterlacingStrings:@[@" ", kLowercaseCharacters, kUppercaseCharacters, kNumericalCharacters, kPunctuationCharacters, kSpecialCharacters]];
            BOOL result = [TWRTypist typeString:string];
            [[@(result) should] beTrue];
            [[[[viewController textField] text] should] beEqualTo:string];
        });
    });

    when(@"the return key is pressed", ^{
        before(^{
            [[viewController textField] setReturnKeyType:UIReturnKeyDefault];
        });
        
        describe(@"the delegate", ^{
            it(@"is notified", ^{
                [[@([TWRTypist pressReturnKey]) should] beTrue];
                [[@([viewController wasReturnKeyPressed]) should] beTrue];
            });
        });
    });

    when(@"the Go key is pressed", ^{
        before(^{
            [[viewController textField] setReturnKeyType:UIReturnKeyGo];
        });
        
        describe(@"the delegate", ^{
            it(@"is notified", ^{
                [[@([TWRTypist pressGoKey]) should] beTrue];
                [[@([viewController wasReturnKeyPressed]) should] beTrue];
            });
        });
    });

    when(@"displaying the Google key", ^{
        before(^{
            [[viewController textField] setReturnKeyType:UIReturnKeyGoogle];
        });
        
        describe(@"the delegate", ^{
            it(@"is notified", ^{
                [[@([TWRTypist pressGoogleKey]) should] beTrue];
                [[@([viewController wasReturnKeyPressed]) should] beTrue];
            });
        });
    });

    when(@"when displaying the Join key", ^{
        before(^{
            [[viewController textField] setReturnKeyType:UIReturnKeyJoin];
        });
        
        describe(@"the delegate", ^{
            it(@"is notified", ^{
                [[@([TWRTypist pressJoinKey]) should] beTrue];
                [[@([viewController wasReturnKeyPressed]) should] beTrue];
            });
        });
    });

    when(@"displaying the Next key", ^{
        before(^{
            [[viewController textField] setReturnKeyType:UIReturnKeyNext];
        });
        
        describe(@"the delegate", ^{
            it(@"is notified", ^{
                [[@([TWRTypist pressNextKey]) should] beTrue];
                [[@([viewController wasReturnKeyPressed]) should] beTrue];
            });
        });
    });

    when(@"displaying the Route key", ^{
        before(^{
            [[viewController textField] setReturnKeyType:UIReturnKeyRoute];
        });
        
        describe(@"the delegate", ^{
            it(@"is notified", ^{
                [[@([TWRTypist pressRouteKey]) should] beTrue];
                [[@([viewController wasReturnKeyPressed]) should] beTrue];
            });
        });
    });

    when(@"displaying the Search key", ^{
        before(^{
            [[viewController textField] setReturnKeyType:UIReturnKeySearch];
        });
        
        describe(@"the delegate", ^{
            it(@"is notified", ^{
                [[@([TWRTypist pressSearchKey]) should] beTrue];
                [[@([viewController wasReturnKeyPressed]) should] beTrue];
            });
        });
    });

    when(@"displaying the Send key", ^{
        before(^{
            [[viewController textField] setReturnKeyType:UIReturnKeySend];
        });
        
        describe(@"the delegate", ^{
            it(@"is notified", ^{
                [[@([TWRTypist pressSendKey]) should] beTrue];
                [[@([viewController wasReturnKeyPressed]) should] beTrue];
            });
        });
    });

    when(@"displaying the Yahoo key", ^{
        before(^{
            [[viewController textField] setReturnKeyType:UIReturnKeyYahoo];
        });
        
        describe(@"the delegate", ^{
            it(@"is notified", ^{
                [[@([TWRTypist pressYahooKey]) should] beTrue];
                [[@([viewController wasReturnKeyPressed]) should] beTrue];
            });
        });
    });

    when(@"displaying the Done key", ^{
        before(^{
            [[viewController textField] setReturnKeyType:UIReturnKeyDone];
        });
        
        describe(@"the delegate", ^{
            it(@"is notified", ^{
                [[@([TWRTypist pressDoneKey]) should] beTrue];
                [[@([viewController wasReturnKeyPressed]) should] beTrue];
            });
        });
    });

    when(@"displaying the Emergency Call key", ^{
        before(^{
            [[viewController textField] setReturnKeyType:UIReturnKeyEmergencyCall];
        });
        
        describe(@"the delegate", ^{
            it(@"is notified", ^{
                [[@([TWRTypist pressEmergencyCallKey]) should] beTrue];
                [[@([viewController wasReturnKeyPressed]) should] beTrue];
            });
        });
    });
});

SpecEnd

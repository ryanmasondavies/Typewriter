//
//  TWREnterCharacterCommandSpec.m
//  Typewriter
//
//  Created by Ryan Davies on 30/10/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import "TWRSpecHelper.h"
#import "TWREnterCharacterCommand.h"

SpecBegin(TWREnterCharacterCommand)

__block TWRTestViewController *viewController;

before(^{
    viewController = [[TWRTestViewController alloc] init];
    [[[UIApplication sharedApplication] keyWindow] setRootViewController:viewController];
});

context(@"when the keyboard is displaying lowercase characters", ^{
    before(^{
        [[viewController textField] setAutocapitalizationType:UITextAutocapitalizationTypeNone];
        [[viewController textField] becomeFirstResponder];
    });
    
    it(@"should enter a lowercase A", ^{
        TWREnterCharacterCommand *enterCharacterCommand = [[TWREnterCharacterCommand alloc] initWithCharacter:'a'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"a");
    });

    it(@"should enter a lowercase B", ^{
        TWREnterCharacterCommand *enterCharacterCommand = [[TWREnterCharacterCommand alloc] initWithCharacter:'b'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"b");
    });

    it(@"should enter a lowercase C", ^{
        TWREnterCharacterCommand *enterCharacterCommand = [[TWREnterCharacterCommand alloc] initWithCharacter:'c'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"c");
    });

    it(@"should enter a lowercase D", ^{
        TWREnterCharacterCommand *enterCharacterCommand = [[TWREnterCharacterCommand alloc] initWithCharacter:'d'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"d");
    });

    it(@"should enter a lowercase E", ^{
        TWREnterCharacterCommand *enterCharacterCommand = [[TWREnterCharacterCommand alloc] initWithCharacter:'e'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"e");
    });

    it(@"should enter a lowercase F", ^{
        TWREnterCharacterCommand *enterCharacterCommand = [[TWREnterCharacterCommand alloc] initWithCharacter:'f'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"f");
    });

    it(@"should enter a lowercase G", ^{
        TWREnterCharacterCommand *enterCharacterCommand = [[TWREnterCharacterCommand alloc] initWithCharacter:'g'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"g");
    });

    it(@"should enter a lowercase H", ^{
        TWREnterCharacterCommand *enterCharacterCommand = [[TWREnterCharacterCommand alloc] initWithCharacter:'h'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"h");
    });

    it(@"should enter a lowercase I", ^{
        TWREnterCharacterCommand *enterCharacterCommand = [[TWREnterCharacterCommand alloc] initWithCharacter:'i'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"i");
    });

    it(@"should enter a lowercase J", ^{
        TWREnterCharacterCommand *enterCharacterCommand = [[TWREnterCharacterCommand alloc] initWithCharacter:'j'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"j");
    });

    it(@"should enter a lowercase K", ^{
        TWREnterCharacterCommand *enterCharacterCommand = [[TWREnterCharacterCommand alloc] initWithCharacter:'k'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"k");
    });

    it(@"should enter a lowercase L", ^{
        TWREnterCharacterCommand *enterCharacterCommand = [[TWREnterCharacterCommand alloc] initWithCharacter:'l'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"l");
    });

    it(@"should enter a lowercase M", ^{
        TWREnterCharacterCommand *enterCharacterCommand = [[TWREnterCharacterCommand alloc] initWithCharacter:'m'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"m");
    });

    it(@"should enter a lowercase N", ^{
        TWREnterCharacterCommand *enterCharacterCommand = [[TWREnterCharacterCommand alloc] initWithCharacter:'n'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"n");
    });

    it(@"should enter a lowercase O", ^{
        TWREnterCharacterCommand *enterCharacterCommand = [[TWREnterCharacterCommand alloc] initWithCharacter:'o'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"o");
    });

    it(@"should enter a lowercase P", ^{
        TWREnterCharacterCommand *enterCharacterCommand = [[TWREnterCharacterCommand alloc] initWithCharacter:'p'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"p");
    });

    it(@"should enter a lowercase Q", ^{
        TWREnterCharacterCommand *enterCharacterCommand = [[TWREnterCharacterCommand alloc] initWithCharacter:'q'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"q");
    });

    it(@"should enter a lowercase R", ^{
        TWREnterCharacterCommand *enterCharacterCommand = [[TWREnterCharacterCommand alloc] initWithCharacter:'r'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"r");
    });

    it(@"should enter a lowercase S", ^{
        TWREnterCharacterCommand *enterCharacterCommand = [[TWREnterCharacterCommand alloc] initWithCharacter:'s'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"s");
    });

    it(@"should enter a lowercase T", ^{
        TWREnterCharacterCommand *enterCharacterCommand = [[TWREnterCharacterCommand alloc] initWithCharacter:'t'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"t");
    });

    it(@"should enter a lowercase U", ^{
        TWREnterCharacterCommand *enterCharacterCommand = [[TWREnterCharacterCommand alloc] initWithCharacter:'u'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"u");
    });

    it(@"should enter a lowercase V", ^{
        TWREnterCharacterCommand *enterCharacterCommand = [[TWREnterCharacterCommand alloc] initWithCharacter:'v'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"v");
    });

    it(@"should enter a lowercase W", ^{
        TWREnterCharacterCommand *enterCharacterCommand = [[TWREnterCharacterCommand alloc] initWithCharacter:'w'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"w");
    });

    it(@"should enter a lowercase X", ^{
        TWREnterCharacterCommand *enterCharacterCommand = [[TWREnterCharacterCommand alloc] initWithCharacter:'x'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"x");
    });

    it(@"should enter a lowercase Y", ^{
        TWREnterCharacterCommand *enterCharacterCommand = [[TWREnterCharacterCommand alloc] initWithCharacter:'y'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"y");
    });

    it(@"should enter a lowercase Z", ^{
        TWREnterCharacterCommand *enterCharacterCommand = [[TWREnterCharacterCommand alloc] initWithCharacter:'z'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"z");
    });
});

context(@"when the keyboard is displaying uppercase characters", ^{
    before(^{
        [[viewController textField] setAutocapitalizationType:UITextAutocapitalizationTypeAllCharacters];
        [[viewController textField] becomeFirstResponder];
    });
    
    it(@"should enter an uppercase A", ^{
        TWREnterCharacterCommand *enterCharacterCommand = [[TWREnterCharacterCommand alloc] initWithCharacter:'A'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"A");
    });
    
    it(@"should enter an uppercase B", ^{
        TWREnterCharacterCommand *enterCharacterCommand = [[TWREnterCharacterCommand alloc] initWithCharacter:'B'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"B");
    });
    
    it(@"should enter an uppercase C", ^{
        TWREnterCharacterCommand *enterCharacterCommand = [[TWREnterCharacterCommand alloc] initWithCharacter:'C'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"C");
    });
    
    it(@"should enter an uppercase D", ^{
        TWREnterCharacterCommand *enterCharacterCommand = [[TWREnterCharacterCommand alloc] initWithCharacter:'D'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"D");
    });
    
    it(@"should enter an uppercase E", ^{
        TWREnterCharacterCommand *enterCharacterCommand = [[TWREnterCharacterCommand alloc] initWithCharacter:'E'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"E");
    });
    
    it(@"should enter an uppercase F", ^{
        TWREnterCharacterCommand *enterCharacterCommand = [[TWREnterCharacterCommand alloc] initWithCharacter:'F'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"F");
    });
    
    it(@"should enter an uppercase G", ^{
        TWREnterCharacterCommand *enterCharacterCommand = [[TWREnterCharacterCommand alloc] initWithCharacter:'G'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"G");
    });
    
    it(@"should enter an uppercase H", ^{
        TWREnterCharacterCommand *enterCharacterCommand = [[TWREnterCharacterCommand alloc] initWithCharacter:'H'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"H");
    });
    
    it(@"should enter an uppercase I", ^{
        TWREnterCharacterCommand *enterCharacterCommand = [[TWREnterCharacterCommand alloc] initWithCharacter:'I'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"I");
    });
    
    it(@"should enter an uppercase J", ^{
        TWREnterCharacterCommand *enterCharacterCommand = [[TWREnterCharacterCommand alloc] initWithCharacter:'J'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"J");
    });
    
    it(@"should enter an uppercase K", ^{
        TWREnterCharacterCommand *enterCharacterCommand = [[TWREnterCharacterCommand alloc] initWithCharacter:'K'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"K");
    });
    
    it(@"should enter an uppercase L", ^{
        TWREnterCharacterCommand *enterCharacterCommand = [[TWREnterCharacterCommand alloc] initWithCharacter:'L'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"L");
    });
    
    it(@"should enter an uppercase M", ^{
        TWREnterCharacterCommand *enterCharacterCommand = [[TWREnterCharacterCommand alloc] initWithCharacter:'M'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"M");
    });
    
    it(@"should enter an uppercase N", ^{
        TWREnterCharacterCommand *enterCharacterCommand = [[TWREnterCharacterCommand alloc] initWithCharacter:'N'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"N");
    });
    
    it(@"should enter an uppercase O", ^{
        TWREnterCharacterCommand *enterCharacterCommand = [[TWREnterCharacterCommand alloc] initWithCharacter:'O'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"O");
    });
    
    it(@"should enter an uppercase P", ^{
        TWREnterCharacterCommand *enterCharacterCommand = [[TWREnterCharacterCommand alloc] initWithCharacter:'P'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"P");
    });
    
    it(@"should enter an uppercase Q", ^{
        TWREnterCharacterCommand *enterCharacterCommand = [[TWREnterCharacterCommand alloc] initWithCharacter:'Q'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"Q");
    });
    
    it(@"should enter an uppercase R", ^{
        TWREnterCharacterCommand *enterCharacterCommand = [[TWREnterCharacterCommand alloc] initWithCharacter:'R'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"R");
    });
    
    it(@"should enter an uppercase S", ^{
        TWREnterCharacterCommand *enterCharacterCommand = [[TWREnterCharacterCommand alloc] initWithCharacter:'S'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"S");
    });
    
    it(@"should enter an uppercase T", ^{
        TWREnterCharacterCommand *enterCharacterCommand = [[TWREnterCharacterCommand alloc] initWithCharacter:'T'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"T");
    });
    
    it(@"should enter an uppercase U", ^{
        TWREnterCharacterCommand *enterCharacterCommand = [[TWREnterCharacterCommand alloc] initWithCharacter:'U'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"U");
    });
    
    it(@"should enter an uppercase V", ^{
        TWREnterCharacterCommand *enterCharacterCommand = [[TWREnterCharacterCommand alloc] initWithCharacter:'V'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"V");
    });
    
    it(@"should enter an uppercase W", ^{
        TWREnterCharacterCommand *enterCharacterCommand = [[TWREnterCharacterCommand alloc] initWithCharacter:'W'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"W");
    });
    
    it(@"should enter an uppercase X", ^{
        TWREnterCharacterCommand *enterCharacterCommand = [[TWREnterCharacterCommand alloc] initWithCharacter:'X'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"X");
    });
    
    it(@"should enter an uppercase Y", ^{
        TWREnterCharacterCommand *enterCharacterCommand = [[TWREnterCharacterCommand alloc] initWithCharacter:'Y'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"Y");
    });
    
    it(@"should enter an uppercase Z", ^{
        TWREnterCharacterCommand *enterCharacterCommand = [[TWREnterCharacterCommand alloc] initWithCharacter:'Z'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"Z");
    });
});

after(^{
    [[[UIApplication sharedApplication] keyWindow] setRootViewController:nil];
});

SpecEnd

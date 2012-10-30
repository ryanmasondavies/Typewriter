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
__block TWREnterCharacterCommand *enterCharacterCommand;

before(^{
    viewController = [[TWRTestViewController alloc] init];
    enterCharacterCommand = [[TWREnterCharacterCommand alloc] init];
    [[[UIApplication sharedApplication] keyWindow] setRootViewController:viewController];
});

context(@"when the keyboard is displaying lowercase characters", ^{
    before(^{
        [[viewController textField] setAutocapitalizationType:UITextAutocapitalizationTypeNone];
        [[viewController textField] becomeFirstResponder];
    });
    
    it(@"should enter a lowercase A", ^{
        [enterCharacterCommand setCharacter:'a'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"a");
    });

    it(@"should enter a lowercase B", ^{
        [enterCharacterCommand setCharacter:'b'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"b");
    });

    it(@"should enter a lowercase C", ^{
        [enterCharacterCommand setCharacter:'c'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"c");
    });

    it(@"should enter a lowercase D", ^{
        [enterCharacterCommand setCharacter:'d'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"d");
    });

    it(@"should enter a lowercase E", ^{
        [enterCharacterCommand setCharacter:'e'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"e");
    });

    it(@"should enter a lowercase F", ^{
        [enterCharacterCommand setCharacter:'f'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"f");
    });

    it(@"should enter a lowercase G", ^{
        [enterCharacterCommand setCharacter:'g'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"g");
    });

    it(@"should enter a lowercase H", ^{
        [enterCharacterCommand setCharacter:'h'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"h");
    });

    it(@"should enter a lowercase I", ^{
        [enterCharacterCommand setCharacter:'i'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"i");
    });

    it(@"should enter a lowercase J", ^{
        [enterCharacterCommand setCharacter:'j'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"j");
    });

    it(@"should enter a lowercase K", ^{
        [enterCharacterCommand setCharacter:'k'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"k");
    });

    it(@"should enter a lowercase L", ^{
        [enterCharacterCommand setCharacter:'l'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"l");
    });

    it(@"should enter a lowercase M", ^{
        [enterCharacterCommand setCharacter:'m'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"m");
    });

    it(@"should enter a lowercase N", ^{
        [enterCharacterCommand setCharacter:'n'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"n");
    });

    it(@"should enter a lowercase O", ^{
        [enterCharacterCommand setCharacter:'o'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"o");
    });

    it(@"should enter a lowercase P", ^{
        [enterCharacterCommand setCharacter:'p'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"p");
    });

    it(@"should enter a lowercase Q", ^{
        [enterCharacterCommand setCharacter:'q'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"q");
    });

    it(@"should enter a lowercase R", ^{
        [enterCharacterCommand setCharacter:'r'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"r");
    });

    it(@"should enter a lowercase S", ^{
        [enterCharacterCommand setCharacter:'s'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"s");
    });

    it(@"should enter a lowercase T", ^{
        [enterCharacterCommand setCharacter:'t'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"t");
    });

    it(@"should enter a lowercase U", ^{
        [enterCharacterCommand setCharacter:'u'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"u");
    });

    it(@"should enter a lowercase V", ^{
        [enterCharacterCommand setCharacter:'v'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"v");
    });

    it(@"should enter a lowercase W", ^{
        [enterCharacterCommand setCharacter:'w'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"w");
    });

    it(@"should enter a lowercase X", ^{
        [enterCharacterCommand setCharacter:'x'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"x");
    });

    it(@"should enter a lowercase Y", ^{
        [enterCharacterCommand setCharacter:'y'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"y");
    });

    it(@"should enter a lowercase Z", ^{
        [enterCharacterCommand setCharacter:'z'];
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
        [enterCharacterCommand setCharacter:'A'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"A");
    });
    
    it(@"should enter an uppercase B", ^{
        [enterCharacterCommand setCharacter:'B'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"B");
    });
    
    it(@"should enter an uppercase C", ^{
        [enterCharacterCommand setCharacter:'C'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"C");
    });
    
    it(@"should enter an uppercase D", ^{
        [enterCharacterCommand setCharacter:'D'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"D");
    });
    
    it(@"should enter an uppercase E", ^{
        [enterCharacterCommand setCharacter:'E'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"E");
    });
    
    it(@"should enter an uppercase F", ^{
        [enterCharacterCommand setCharacter:'F'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"F");
    });
    
    it(@"should enter an uppercase G", ^{
        [enterCharacterCommand setCharacter:'G'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"G");
    });
    
    it(@"should enter an uppercase H", ^{
        [enterCharacterCommand setCharacter:'H'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"H");
    });
    
    it(@"should enter an uppercase I", ^{
        [enterCharacterCommand setCharacter:'I'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"I");
    });
    
    it(@"should enter an uppercase J", ^{
        [enterCharacterCommand setCharacter:'J'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"J");
    });
    
    it(@"should enter an uppercase K", ^{
        [enterCharacterCommand setCharacter:'K'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"K");
    });
    
    it(@"should enter an uppercase L", ^{
        [enterCharacterCommand setCharacter:'L'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"L");
    });
    
    it(@"should enter an uppercase M", ^{
        [enterCharacterCommand setCharacter:'M'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"M");
    });
    
    it(@"should enter an uppercase N", ^{
        [enterCharacterCommand setCharacter:'N'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"N");
    });
    
    it(@"should enter an uppercase O", ^{
        [enterCharacterCommand setCharacter:'O'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"O");
    });
    
    it(@"should enter an uppercase P", ^{
        [enterCharacterCommand setCharacter:'P'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"P");
    });
    
    it(@"should enter an uppercase Q", ^{
        [enterCharacterCommand setCharacter:'Q'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"Q");
    });
    
    it(@"should enter an uppercase R", ^{
        [enterCharacterCommand setCharacter:'R'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"R");
    });
    
    it(@"should enter an uppercase S", ^{
        [enterCharacterCommand setCharacter:'S'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"S");
    });
    
    it(@"should enter an uppercase T", ^{
        [enterCharacterCommand setCharacter:'T'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"T");
    });
    
    it(@"should enter an uppercase U", ^{
        [enterCharacterCommand setCharacter:'U'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"U");
    });
    
    it(@"should enter an uppercase V", ^{
        [enterCharacterCommand setCharacter:'V'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"V");
    });
    
    it(@"should enter an uppercase W", ^{
        [enterCharacterCommand setCharacter:'W'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"W");
    });
    
    it(@"should enter an uppercase X", ^{
        [enterCharacterCommand setCharacter:'X'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"X");
    });
    
    it(@"should enter an uppercase Y", ^{
        [enterCharacterCommand setCharacter:'Y'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"Y");
    });
    
    it(@"should enter an uppercase Z", ^{
        [enterCharacterCommand setCharacter:'Z'];
        [enterCharacterCommand execute];
        expect([[viewController textField] text]).to.equal(@"Z");
    });
});

after(^{
    [[[UIApplication sharedApplication] keyWindow] setRootViewController:nil];
});

SpecEnd

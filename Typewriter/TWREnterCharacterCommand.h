//
//  TWREnterCharacterCommand.h
//  Typewriter
//
//  Created by Ryan Davies on 30/10/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import "TWRTypingCommand.h"

@interface TWREnterCharacterCommand : TWRTypingCommand
@property (nonatomic) unichar character;
- (id)initWithCharacter:(unichar)character;
@end

//
//  TWRTypingCommand.h
//  Typewriter
//
//  Created by Ryan Davies on 30/10/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKBKeyplaneView.h"

@interface TWRTypingCommand : NSObject

- (UIKBTree *)key;
- (void)execute;

@end

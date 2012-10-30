//
//  TWRTypist.h
//  Typewriter
//
//  Created by Ryan Davies on 29/10/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TWRTypist : NSObject
@property (strong, nonatomic) NSMutableArray *stack;

- (void)enterString:(NSString *)string;

@end

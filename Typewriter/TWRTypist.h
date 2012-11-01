//
//  TWRTypist.h
//  Typewriter
//
//  Created by Ryan Davies on 29/10/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TWRTypist : NSObject

+ (BOOL)typeString:(NSString *)string;

+ (BOOL)pressReturnKey;
+ (BOOL)pressGoKey;
+ (BOOL)pressGoogleKey;
+ (BOOL)pressJoinKey;
+ (BOOL)pressNextKey;

@end

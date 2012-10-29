//
//  UIView+TWRSearching.m
//  UDP Remote
//
//  Created by Ryan Davies on 28/10/2012.
//  Copyright (c) 2012 Alcorn McBride. All rights reserved.
//

#import "UIView+TWRSearching.h"

@implementation UIView (TWRSearching)

- (NSArray *)subviewsPassingTest:(BOOL (^)(id object, NSUInteger index, BOOL *stop))test recursive:(BOOL)recursive
{
    NSMutableArray *results = [NSMutableArray array];
    [[self subviews] enumerateObjectsUsingBlock:^(UIView *subview, NSUInteger index, BOOL *stop) {
        if (test(subview, index, stop))
            [results addObject:subview];
        
        if (recursive)
            [results addObjectsFromArray:[subview subviewsPassingTest:test recursive:YES]];
    }];
    
    return ([results count] ? [NSArray arrayWithArray:results] : nil);
}

@end

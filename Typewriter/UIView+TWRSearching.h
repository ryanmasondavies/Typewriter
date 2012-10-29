//
//  UIView+TWRSearching.h
//  UDP Remote
//
//  Created by Ryan Davies on 28/10/2012.
//  Copyright (c) 2012 Alcorn McBride. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (TWRSearching)

- (NSArray *)subviewsPassingTest:(BOOL (^)(id object, NSUInteger index, BOOL *stop))test recursive:(BOOL)recursive;

@end

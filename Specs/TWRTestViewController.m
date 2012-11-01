//
//  TWRTestViewController.m
//  Typewriter
//
//  Created by Ryan Davies on 30/10/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import "TWRTestViewController.h"

@implementation TWRTestViewController

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return (self.returnKeyPressed = YES);
}

@end

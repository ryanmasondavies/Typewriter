//
//  TWRTestViewController.m
//  Typewriter
//
//  Created by Ryan Davies on 30/10/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import "TWRTestViewController.h"

@implementation TWRTestViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.textView = [[UITextView alloc] init];
    [[self textView] setFrame:[[self view] frame]];
    [[self view] addSubview:[self textView]];
}

@end

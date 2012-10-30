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
    
    self.textField = [[UITextField alloc] init];
    [[self textField] setFrame:CGRectMake(32, 32, 128, 24)];
    [[self textField] setAutocorrectionType:UITextAutocorrectionTypeNo];
    [[self view] addSubview:[self textField]];
}

@end

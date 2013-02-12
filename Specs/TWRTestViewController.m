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
    [[self textField] setFrame:[[self view] frame]];
    [[self textField] setAutocorrectionType:UITextAutocorrectionTypeNo];
    [[self textField] setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    [[self textField] setDelegate:self];
    [[self view] addSubview:[self textField]];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[self textField] becomeFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return (self.returnKeyPressed = YES);
}

@end

//
//  TWRTestViewController.h
//  Typewriter
//
//  Created by Ryan Davies on 30/10/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TWRTestViewController : UIViewController <UITextFieldDelegate, UITextViewDelegate>
@property (strong, nonatomic) UITextField *textField;
@property (nonatomic, getter = wasReturnKeyPressed) BOOL returnKeyPressed;
@end

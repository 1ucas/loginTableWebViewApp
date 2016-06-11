//
//  InputField.m
//  LoginAndWebApp
//
//  Created by Lucas Maciel on 6/11/16.
//  Copyright © 2016 Lucas Maciel. All rights reserved.
//

#import "InputField.h"

@implementation InputField 

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.delegate = self;
        UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
        self.leftView = paddingView;
        self.leftViewMode = UITextFieldViewModeAlways;
        if(self.keyboardType == UIKeyboardTypeNumberPad){
            UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
            numberToolbar.barStyle = UIBarStyleDefault;
            numberToolbar.items = @[[[UIBarButtonItem alloc]initWithTitle:@"Cancelar" style:UIBarButtonItemStylePlain target:self action:@selector(cancelNumberPad)],
                                    [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                                    [[UIBarButtonItem alloc]initWithTitle:@"Confirmar" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)]];
            [numberToolbar sizeToFit];
            self.inputAccessoryView = numberToolbar;
            
        }
        //self.backgroundColor = [UIColor colorWithRed:0/255. green:30/255. blue:255/255. alpha:0.2];
    }
    return self;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(void)cancelNumberPad{
    [self resignFirstResponder];
    self.text = @"";
}

-(void)doneWithNumberPad{
    [self resignFirstResponder];
}

@end

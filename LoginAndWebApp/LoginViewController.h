//
//  LoginViewController.h
//  LoginAndWebApp
//
//  Created by Lucas Maciel on 6/11/16.
//  Copyright © 2016 Lucas Maciel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InputField.h"

@interface LoginViewController : UIViewController

@property (weak, nonatomic) IBOutlet InputField *txtUsername;
@property (weak, nonatomic) IBOutlet InputField *txtPassword;


- (IBAction)loginUser:(UIButton *)sender;
- (IBAction)createUser:(UIButton *)sender;

@end

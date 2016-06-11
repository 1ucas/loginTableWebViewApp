//
//  LoginViewController.m
//  LoginAndWebApp
//
//  Created by Lucas Maciel on 6/11/16.
//  Copyright © 2016 Lucas Maciel. All rights reserved.
//

#import "LoginViewController.h"
#import "User.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.txtPassword.text = @"";
    self.txtUsername.text = @"";
    self.navigationItem.backBarButtonItem =
    [[UIBarButtonItem alloc] initWithTitle:@"Log Out"
                                     style:UIBarButtonItemStylePlain
                                    target:nil
                                    action:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (IBAction)loginUser:(UIButton *)sender {
    if([self fieldsNotEmpty]){
        if([self authUser:self.txtUsername.text password:self.txtPassword.text]){
            self.txtUsername.text = @"";
            self.txtPassword.text = @"";
            [self performSegueWithIdentifier:@"navigationToList"sender:self];
        }
    }
}

- (IBAction)createUser:(UIButton *)sender {
    if([self fieldsNotEmpty]){
        [self newUser:self.txtUsername.text password:self.txtPassword.text];
        self.txtUsername.text = @"";
        self.txtPassword.text = @"";
    }
}


-(BOOL)newUser:(NSString*)username password:(NSString*)password{
    NSMutableArray *usersArray = [[User listFromDictionaries:[[NSUserDefaults standardUserDefaults] objectForKey:@"usersArray"]] mutableCopy];
    if(usersArray == nil){
        usersArray = [[NSMutableArray alloc] init];
    }
    for (User *user in usersArray) {
        if(user.username == username){
            [self showMessage:@"Username already in use. Choose another." withTitle:@"Sorry..."];
            return NO;
        }
    }
    User* userToAdd = [[User alloc] init];
    userToAdd.username = username;
    userToAdd.password = password;
    [usersArray addObject:userToAdd];
    [[NSUserDefaults standardUserDefaults] setObject:[User toDictionaryList:usersArray] forKey:@"usersArray"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self showMessage:@"User created!" withTitle:@"Sucess!"];
    return YES;
}



-(BOOL)authUser:(NSString*)username password:(NSString*)password{
    NSMutableArray *usersArray = [[User listFromDictionaries:[[NSUserDefaults standardUserDefaults] objectForKey:@"usersArray"]] mutableCopy];
    for (User *user in usersArray) {
        if(user.username == username){
            if(user.password == password){
                return YES;
            }
            else {
                [self showMessage:@"Wrong Password." withTitle:@"Ops..."];
                return false;
            }
        }
    }
    [self showMessage:@"User not found." withTitle:@"Ops..."];
    return NO;
}


#pragma mark - Helper Methods

-(void)showMessage:(NSString*)message withTitle:(NSString *)title
{
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:title
                                  message:message
                                  preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
    }];
    [alert addAction:okAction];
    [self presentViewController:alert animated:YES completion:nil];
}

-(BOOL)fieldsNotEmpty{
    if([self.txtUsername.text isEqualToString: @""] || [self.txtPassword.text isEqualToString: @""]){
        [self showMessage:@"Fields cannot be empty" withTitle:@"Alert!"];
        return false;
    }
    return true;
}


@end

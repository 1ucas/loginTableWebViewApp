//
//  WebsiteViewController.h
//  LoginAndWebApp
//
//  Created by Lucas Maciel on 6/11/16.
//  Copyright © 2016 Lucas Maciel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebsiteViewController : UIViewController

@property (strong, nonatomic) NSString *website;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

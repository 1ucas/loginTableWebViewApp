//
//  ListViewController.h
//  LoginAndWebApp
//
//  Created by Lucas Maciel on 6/11/16.
//  Copyright © 2016 Lucas Maciel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

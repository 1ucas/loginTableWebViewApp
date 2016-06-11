//
//  ListViewController.m
//  LoginAndWebApp
//
//  Created by Lucas Maciel on 6/11/16.
//  Copyright © 2016 Lucas Maciel. All rights reserved.
//

#import "ListViewController.h"
#import "WebsiteTableViewCell.h"
#import "WebsiteViewController.h"


@interface ListViewController ()

@property (strong,nonatomic) NSMutableArray* websiteArray;
@property (strong, nonatomic) NSString* selectedItem;

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.websiteArray = [[NSMutableArray alloc] init];
    [self.websiteArray addObjectsFromArray:@[@"https://www.frantastique.com/en/",
                                            @"https://www.gymglish.com/en/",
                                            @"http://www.thewordofthemonth.com/en/word/impeach",
                                            @"https://worksweetwork.com",
                                            @"http://www.vatefaireconjuguer.com",
                                            @"https://www.gymglish.com/pt/"]];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableView DataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.websiteArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WebsiteTableViewCell *cell = (WebsiteTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"websiteCell"];
    cell.lblName.text = [self.websiteArray objectAtIndex:indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 55;
}

#pragma mark - UITableView Delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.selectedItem = [self.websiteArray objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"toWebViewController" sender:self];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    WebsiteViewController* websiteController = (WebsiteViewController*)[segue destinationViewController];
    websiteController.website = self.selectedItem;
}

@end

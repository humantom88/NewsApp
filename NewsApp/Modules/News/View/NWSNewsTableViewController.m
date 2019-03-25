//
//  NewsTableViewController.m
//  NewsApp
//
//  Created by Tom Belov on 21/03/2019.
//  Copyright © 2019 Tom Belov. All rights reserved.
//

#import "NWSNewsTableViewController.h"
#import "NWSNewsTableViewOutput.h"
#import "NWSNewsPresenter.h"
#import "NWSNewsTableViewCell.h"
#import "NWSArticleViewController.h"

@interface NWSNewsTableViewController ()

@end

@implementation NWSNewsTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [_output loadNewsData];
}

- (void)displayNews
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_output.articles count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NWSNewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NewsCell"
                                                                 forIndexPath:indexPath];;
    
    [cell setInternalFields:_output.articles[indexPath.row]];
    
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    if ([segue.identifier isEqualToString:@"ArticleViewController"]) {
        
        UITableViewCell *cell = (UITableViewCell *)sender;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        
        NWSArticleViewController *destination = (NWSArticleViewController *)[segue destinationViewController];
        
        destination.article = _output.articles[indexPath.row];
    }

}

@end

//
//  NewsViewController.m
//  Fofoca
//
//  Created by Alexandre Marones on 1/29/13.
//  Copyright (c) 2013 4Mobile. All rights reserved.
//

#import "NewsViewController.h"

@interface NewsViewController ()

@end

@implementation NewsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self loadingListWithNews];
    
    [self setUpPullToRefreshInTableViewOfList];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#pragma mark - Pull to Refresh

- (void)setUpPullToRefreshInTableViewOfList {
    if (![self refreshControl]) {
        self.refreshControl = [[UIRefreshControl alloc] init];
        [self.refreshControl addTarget:self action:@selector(loadingListWithNews) forControlEvents:UIControlEventValueChanged];
        
        [[self tableView] addSubview:self.refreshControl];
    }
}

- (void)hideRefreshControl {
    if ([self refreshControl]) {
        [self.refreshControl endRefreshing];
    }
}


#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.news count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"newsCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    NewsModel *item = [self.news objectAtIndex:[indexPath row]];
    
    UILabel *time = (UILabel *)[cell viewWithTag:102];
    UILabel *title = (UILabel *)[cell viewWithTag:103];
    UILabel *author = (UILabel *)[cell viewWithTag:101];
    
    [time setText:[item.publishedAt humanIntervalAgoSinceNow]];
    [title setText:item.title];
    [author setText:item.origin];
    
    [title sizeToFit];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:NO];
//    TSMiniWebBrowser *webBrowser = [TSMiniWebBrowser browserWithUrl:[NSURL URLWithString:[[self.news objectAtIndex:[indexPath row]] link]] delegate:self];
//    
//    [self.navigationController pushViewController:webBrowser animated:YES];
}


#pragma mark - Loading

- (void)loadingListWithNews {
    [EGOCache setUrl:K_URL_NEWS withTimeoutInterval:K_CACHE_TIME_GOOGLE_READER onSuccessPerform:^(NSString *content, BOOL isNew, NSError *error) {
        if (error == nil) {
            NSDictionary *dic = [content objectFromJSONString];
            self.news = [NewsModel parseWithArray:[dic objectForKey:@"items"]];
            
            NSLog(@"Quantidade encontrado pelo parse: %i", [self.news count]);
        }
    }];
    
    [[self tableView] reloadData];
    [self hideRefreshControl];
}

@end

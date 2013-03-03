//
//  CelebritiesViewController.m
//  Fofoca
//
//  Created by Alexandre Marones on 2/28/13.
//  Copyright (c) 2013 4Mobile. All rights reserved.
//

#import "CelebritiesViewController.h"

@interface CelebritiesViewController ()

@end

@implementation CelebritiesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.topCelebrities = [CelebrityModel parseTopCelebrities];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.topCelebrities count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"topCelebrityCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];

    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    UILabel *celebrityName = (UILabel *)[cell viewWithTag:121];
    
    CelebrityModel *celebrity = [[CelebrityModel alloc] init];
    
    celebrity = [self.topCelebrities objectAtIndex:indexPath.row];
    
    celebrityName.text = celebrity.name;

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:NO];
//    [self performSegueWithIdentifier:@"segueCelebritiesToCelebrity" sender:indexPath];
}


@end

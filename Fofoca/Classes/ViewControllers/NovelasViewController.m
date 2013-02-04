//
//  SecondViewController.m
//  Fofoca
//
//  Created by Asher L Coelho on 1/28/13.
//  Copyright (c) 2013 4Mobile. All rights reserved.
//

#import "NovelasViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface NovelasViewController ()

@end

@implementation NovelasViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.emissoras = [EmissoraModel parseEmissora];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath = sender;
    
    EmissoraModel *emissora = [[EmissoraModel alloc] init];
    
    emissora = [self.emissoras objectAtIndex:indexPath.section];
    
    NovelaModel *novela = [[NovelaModel alloc] init];
    
    novela = [emissora.novelas objectAtIndex:indexPath.row];
    
    if ([[segue identifier] isEqualToString:@"segueNovelasToResume"]) {
        NovelaViewController *novelaVC = [segue destinationViewController];
        novelaVC.novelaName = novela.name;
    }
}


#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.emissoras count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    EmissoraModel *emissora = [[EmissoraModel alloc] init];
    emissora = [self.emissoras objectAtIndex:section];
    return [emissora.novelas count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	return [[self.emissoras objectAtIndex:section] name];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"novelaCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    UILabel *novelaName = (UILabel *)[cell viewWithTag:121];
    UILabel *novelaChapter = (UILabel *)[cell viewWithTag:122];
    UIImageView *novelaImage = (UIImageView *)[cell viewWithTag:123];

    EmissoraModel *emissora = [[EmissoraModel alloc] init];

    emissora = [self.emissoras objectAtIndex:indexPath.section];

    NovelaModel *novela = [[NovelaModel alloc] init];
    
    novela = [emissora.novelas objectAtIndex:indexPath.row];
    novelaName.text = novela.name;
    novelaChapter.text = novela.firstChapter;
    
    //TODO: Resolver problema de imagem por url.
//    NSString *urlImage = novela.firstChapterImage;
//    
//    if (urlImage) {
//        NSLog(@"url image >>> %@", urlImage);
//        [novelaImage setImageWithURL:[NSURL URLWithString:urlImage]];
//    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90;
}


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:NO];
    [self performSegueWithIdentifier:@"segueNovelasToResume" sender:indexPath];
}

@end

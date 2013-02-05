//
//  NovelaViewController.m
//  Fofoca
//
//  Created by Alexandre Marones on 2/4/13.
//  Copyright (c) 2013 4Mobile. All rights reserved.
//

#import "NovelaViewController.h"

@interface NovelaViewController ()

@end

@implementation NovelaViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	[self changeTitleNavigationBarForNovelaName:self.novelaName];
    
    self.chapters = [ChapterModel parseChaptersWithNovela:self.novelaName];
    NSLog(@"contando >>> %i", [self.chapters count]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)changeTitleNavigationBarForNovelaName:(NSString *)novelaName {
    UILabel *navBarTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 20)];
    [navBarTitle setBackgroundColor:[UIColor clearColor]];
//    [navBarTitle setFont:[UIFont fontWithName:@"System-Bold" size:16.0]];
    [navBarTitle setTextAlignment:NSTextAlignmentCenter];
    [navBarTitle setTextColor:[UIColor whiteColor]];
    [navBarTitle setText:novelaName];
    [[self navigationItem] setTitleView:navBarTitle];
}


#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.chapters count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"chapterCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    UILabel *chapterTitle = (UILabel *)[cell viewWithTag:112];
    UILabel *chapterDate = (UILabel *)[cell viewWithTag:113];
    UIImageView *chapterImage = (UIImageView *)[cell viewWithTag:111];
    
    ChapterModel *chapter = [[ChapterModel alloc] init];
    
    chapter = [self.chapters objectAtIndex:indexPath.row];
        
    chapterTitle.text = chapter.title;
    chapterDate.text = chapter.exhibitionAt;
    
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
//    [self performSegueWithIdentifier:@"segueNovelasToResume" sender:indexPath];
}

@end

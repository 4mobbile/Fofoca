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
    
    self.chapters = [NovelaModel parseChaptersWithNovela:self.novelaName];
//    NSLog(@"contando >>> %i", [self.chapters count]);
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

@end

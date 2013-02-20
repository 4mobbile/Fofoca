//
//  HoroscopViewController.m
//  Fofoca
//
//  Created by Alexandre Marones on 2/19/13.
//  Copyright (c) 2013 4Mobile. All rights reserved.
//

#import "HoroscopViewController.h"

@interface HoroscopViewController ()

@end

@implementation HoroscopViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"segueHoroscopToSigno"]) {
        NSString *nameSigno = sender;
        SignoViewController *signoVC = [segue destinationViewController];
        signoVC.nameSigno = nameSigno;
    }
}

- (IBAction)goToSignoVC:(id)sender {
    [self performSegueWithIdentifier:@"segueHoroscopToSigno" sender:@"peixes"];
}

@end

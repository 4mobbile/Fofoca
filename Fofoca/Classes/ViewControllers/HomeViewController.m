//
//  FirstViewController.m
//  Fofoca
//
//  Created by Asher L Coelho on 1/28/13.
//  Copyright (c) 2013 4Mobile. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
}


#pragma mark - IBAction

- (IBAction)goToNoticias:(id)sender {
    [self performSegueWithIdentifier:@"segueHomeToNoticias" sender:nil];
}

- (IBAction)goToNovelas:(id)sender {
    [self performSegueWithIdentifier:@"segueHomeToNovelas" sender:nil];
}

- (IBAction)goToFotogalerias:(id)sender {
    [self performSegueWithIdentifier:@"segueHomeToFotogaleria" sender:nil];
}

- (IBAction)goToFamosos:(id)sender {
    [self performSegueWithIdentifier:@"segueHomeToFamosos" sender:nil];
}

- (IBAction)goToHoroscopo:(id)sender {
    [self performSegueWithIdentifier:@"segueHomeToHoroscopo" sender:nil];
}
@end

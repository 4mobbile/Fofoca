//
//  FirstViewController.m
//  Fofoca
//
//  Created by Asher L Coelho on 1/28/13.
//  Copyright (c) 2013 4Mobile. All rights reserved.
//

#import "HomeViewController.h"
#import "JSONKit.h"
#import "EGOCache+PGCache.h"
#import "NovelaModel+Parse.h"
#import "YQL.h"
#import "NSString+PGString.h"
#import "PKRevealController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImage *menuIcon = [UIImage imageNamed:@"menu_icon"];
    if (self.navigationController.revealController.type & PKRevealControllerTypeLeft)
    {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:menuIcon landscapeImagePhone:menuIcon style:UIBarButtonItemStylePlain target:self action:@selector(showLeftView:)];
    }   
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
}


#pragma mark - Actions

- (void)showLeftView:(id)sender
{
    if (self.navigationController.revealController.focusedController == self.navigationController.revealController.leftViewController)
    {
        [self.navigationController.revealController showViewController:self.navigationController.revealController.frontViewController];
    }
    else
    {
        [self.navigationController.revealController showViewController:self.navigationController.revealController.leftViewController];
    }
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

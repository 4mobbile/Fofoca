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
    NSString *signo = [[NSString alloc] init];
    
    switch ([sender tag]) {
        case 1:
            signo = K_CAPRICORNIO;
            break;
        case 2:
            signo = K_AQUARIO;
            break;
        case 3:
            signo = K_PEIXES;
            break;
        case 4:
            signo = K_ARIES;
            break;
        case 5:
            signo = K_TOURO;
            break;
        case 6:
            signo = K_GEMEOS;
            break;
        case 7:
            signo = K_CANCER;
            break;
        case 8:
            signo = K_LEAO;
            break;
        case 9:
            signo = K_VIRGEM;
            break;
        case 10:
            signo = K_LIBRA;
            break;
        case 11:
            signo = K_ESCORPIAO;
            break;
        case 12:
            signo = K_SAGITARIO;
            break;
            
        default:
            break;
    }
    [self performSegueWithIdentifier:@"segueHoroscopToSigno" sender:signo];
}

@end

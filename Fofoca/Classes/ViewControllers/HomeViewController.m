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

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSString *url = K_YQL_NOVELA_FUXICO;
    
    NSString *nameNovela = [[NSString alloc] init];
    nameNovela = @"Salve Jorge";
    
    url = [url stringByReplacingOccurrencesOfString:@"%@" withString:[NovelaModel ajustNameNovelaWithString:nameNovela]];
    
    [EGOCache setYQL:url withTimeoutInterval:K_CACHE_TIME onSuccessPerform:^(NSString *content, NSError *error) {
        
        NSDictionary *dic = [content objectFromJSONString];
        NSDictionary *result = [[dic objectForKey:@"query"] objectForKey:@"results"];
        
        NSLog(@"dic >>> %@", [result description]);
        
        if (result != nil && ![result isKindOfClass:NSClassFromString(@"NSNull")]) {
            for (NSDictionary *item in [YQL forceArrayWithId:[[result objectForKey:@"div"] objectForKey:@"ul"]]) {
                NSLog(@"description >>> %@", [item description]);
                
            }
        }
    }];

        
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

//
//  SignoViewController.m
//  Fofoca
//
//  Created by Alexandre Marones on 2/20/13.
//  Copyright (c) 2013 4Mobile. All rights reserved.
//

#import "SignoViewController.h"

@interface SignoViewController ()

@end

@implementation SignoViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.signo = [SignoModel parseSignoByYQLWithName:self.nameSigno];
    
    self.labelNameSigno.text = [self.nameSigno uppercaseString];
    self.textResume.text = self.signo.resume;
    self.textLoveResume.text = self.signo.loveResume;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

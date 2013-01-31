//
//  FotogaleriaViewController.m
//  Fofoca
//
//  Created by Asher L Coelho on 1/30/13.
//  Copyright (c) 2013 4Mobile. All rights reserved.
//

#import "FotogaleriaViewController.h"

@interface FotogaleriaViewController () <UITextFieldDelegate>
    @property(nonatomic, weak) IBOutlet UIToolbar *toolbar;
    @property(nonatomic, weak) IBOutlet UIBarButtonItem *shareButton;
    @property(nonatomic, weak) IBOutlet UITextField *textField;

- (IBAction)shareButtonTapped:(id)sender;
@end

@implementation FotogaleriaViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)shareButtonTapped:(id)sender {
    // TODO
}

@end

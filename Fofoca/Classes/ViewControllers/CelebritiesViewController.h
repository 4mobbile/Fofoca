//
//  CelebritiesViewController.h
//  Fofoca
//
//  Created by Alexandre Marones on 2/28/13.
//  Copyright (c) 2013 4Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CelebrityModel+Parse.h"

@interface CelebritiesViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *topCelebritiesTableView;

@property (nonatomic, strong) NSArray *topCelebrities;

@end

//
//  ListCelebritiesViewController.h
//  Fofoca
//
//  Created by Alexandre Marones on 3/3/13.
//  Copyright (c) 2013 4Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CelebrityModel+Parse.h"

@interface ListCelebritiesViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *celebritiesTableView;

@property (nonatomic, strong) NSArray *celebrities;

@end

//
//  NovelaViewController.h
//  Fofoca
//
//  Created by Alexandre Marones on 2/4/13.
//  Copyright (c) 2013 4Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EmissoraModel+Parse.h"
#import "NovelaModel+Parse.h"

@interface NovelaViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, strong) NSString *novelaName;
@property(nonatomic, strong) NSArray *chapters;

@end

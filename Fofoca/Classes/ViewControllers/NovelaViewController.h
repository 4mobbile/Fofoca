//
//  NovelaViewController.h
//  Fofoca
//
//  Created by Alexandre Marones on 2/4/13.
//  Copyright (c) 2013 4Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "EmissoraModel+Parse.h"
#import "NovelaModel+Parse.h"
#import "ChapterViewController.h"

@interface NovelaViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *novelaTableView;

@property(nonatomic, strong) NSString *novelaName;
@property(nonatomic, strong) NSArray *chapters;

@end

//
//  SecondViewController.h
//  Fofoca
//
//  Created by Asher L Coelho on 1/28/13.
//  Copyright (c) 2013 4Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "EmissoraModel+Parse.h"
#import "NovelaModel+Parse.h"
#import "NSString+PGString.h"
#import "NovelaViewController.h"

@interface NovelasViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *novelasTableView;

@property (nonatomic, strong) NSArray *emissoras;
@property (nonatomic, strong) NSArray *novelas;

@end

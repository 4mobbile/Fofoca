//
//  NewsViewController.h
//  Fofoca
//
//  Created by Alexandre Marones on 1/29/13.
//  Copyright (c) 2013 4Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSONKit.h"
#import "NewsModel+Parse.h"
#import "Global.h"
#import "TSMiniWebBrowser.h"
#import "NSDate+HumanInterval.h"

@interface NewsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSArray *news;
@property (nonatomic, strong) UIRefreshControl *refreshControl;

@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

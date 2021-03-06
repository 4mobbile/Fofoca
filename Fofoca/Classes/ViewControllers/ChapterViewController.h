//
//  ChapterViewController.h
//  Fofoca
//
//  Created by Alexandre Marones on 2/18/13.
//  Copyright (c) 2013 4Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import <QuartzCore/QuartzCore.h>
#import "ChapterModel+Parse.h"

@interface ChapterViewController : UIViewController

@property (strong, nonatomic) ChapterModel *chapter;

@property (weak, nonatomic) IBOutlet UILabel *chapterTitle;
@property (weak, nonatomic) IBOutlet UIImageView *chapterImage;
@property (weak, nonatomic) IBOutlet UITextView *chapterResume;


@end

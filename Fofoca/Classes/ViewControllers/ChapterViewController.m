//
//  ChapterViewController.m
//  Fofoca
//
//  Created by Alexandre Marones on 2/18/13.
//  Copyright (c) 2013 4Mobile. All rights reserved.
//

#import "ChapterViewController.h"

@interface ChapterViewController ()

@end

@implementation ChapterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.chapter = [ChapterModel parseResumeAndImageChapterWithChapter:[self chapter]];
    self.chapterTitle.text = self.chapter.title;
    self.chapterResume.text = self.chapter.resume;
    
    if (self.chapter.image) {
        [self.chapterImage setImageWithURL:[NSURL URLWithString:self.chapter.image] placeholderImage:nil];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

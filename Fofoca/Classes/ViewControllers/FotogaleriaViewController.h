//
//  FotogaleriaViewController.h
//  Fofoca
//
//  Created by Asher L Coelho on 1/30/13.
//  Copyright (c) 2013 4Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Flickr.h"
#import "FlickrPhoto.h"

@interface FotogaleriaViewController : UIViewController 

@property(nonatomic, strong) NSMutableDictionary *searchResults;
@property(nonatomic, strong) NSMutableArray *searches;
@property(nonatomic, strong) Flickr *flickr;

@end

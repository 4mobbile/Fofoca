//
//  AppDelegate.h
//  Fofoca
//
//  Created by Asher L Coelho on 1/28/13.
//  Copyright (c) 2013 4Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PKRevealController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic, strong, readwrite) PKRevealController *revealController;
@property (strong, nonatomic) UIWindow *window;

@end

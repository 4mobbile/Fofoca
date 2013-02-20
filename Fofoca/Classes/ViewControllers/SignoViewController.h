//
//  SignoViewController.h
//  Fofoca
//
//  Created by Alexandre Marones on 2/20/13.
//  Copyright (c) 2013 4Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SignoModel+Parse.h"

@interface SignoViewController : UIViewController

@property (strong, nonatomic) NSString *nameSigno;
@property (strong, nonatomic) SignoModel *signo;

@property (weak, nonatomic) IBOutlet UILabel *labelNameSigno;
@property (weak, nonatomic) IBOutlet UITextView *textResume;
@property (weak, nonatomic) IBOutlet UITextView *textLoveResume;


@end

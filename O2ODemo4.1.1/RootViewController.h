//
//  RootViewController.h
//  O2ODemo4.1.1
//
//  Created by 祝翔龙 on 15/12/1.
//  Copyright © 2015年 祝翔龙. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SeaFoodViewController.h"
#import "ServiceViewController.h"
#import "UserViewController.h"
#import "FavorableViewController.h"
#import "ExplainViewController.h"

@interface RootViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *seaFoodImage;

@property (weak, nonatomic) IBOutlet UIImageView *favorableImage;

@property (weak, nonatomic) IBOutlet UIImageView *serviceImage;

@property (weak, nonatomic) IBOutlet UIImageView *userImage;

@property (weak, nonatomic) IBOutlet UIImageView *explainImage;

@end

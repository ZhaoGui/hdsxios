//
//  AppDelegate.h
//  O2ODemo4.1.1
//
//  Created by 祝翔龙 on 15/12/1.
//  Copyright © 2015年 祝翔龙. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AssistiveTouch.h"
#import "UserGuideViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    AssistiveTouch *assTouch;
}
@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UINavigationController *navigationController;

@end


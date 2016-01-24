//
//  AssistiveTouch.h
//  O2ODemo4.1.1
//
//  Created by 祝翔龙 on 15/12/1.
//  Copyright © 2015年 祝翔龙. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"
#import "SeaFoodViewController.h"

@protocol AssistiveTouchDelegate;
@interface AssistiveTouch : UIWindow
{
    UIImageView *_imageView;
//    UIButton *_button;
}
@property (strong, nonatomic) UINavigationController *navigationController;

@property(nonatomic,assign) BOOL isShowMenu;

@property(nonatomic,unsafe_unretained) id<AssistiveTouchDelegate> assistiveDelegate;

-(id)initWithFrame:(CGRect)frame imageName:(NSString*)name;

@end

@protocol AssistiveTouchDelegate <NSObject>

@optional

-(void)assistiveTocuhs;

@end

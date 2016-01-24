//
//  FavorableViewController.h
//  O2ODemo4.1.1
//
//  Created by liushuai on 15/12/4.
//  Copyright © 2015年 祝翔龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FavorableViewController : UIViewController
{
    UIWebView *webView;
    UIActivityIndicatorView *activityIndicatorView;
    UIImageView *loadImageView;
}
@property(strong, nonatomic)UIButton *btn;

@end

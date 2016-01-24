//
//  ExplainViewController.h
//  O2ODemo4.1.1
//
//  Created by 杜潇潇 on 15/12/8.
//  Copyright © 2015年 祝翔龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExplainViewController : UIViewController
{
    UIWebView *webView;
    UIActivityIndicatorView *activityIndicatorView;
    UIImageView *loadImageView;
}
@property(strong, nonatomic)UIButton *btn;

@end

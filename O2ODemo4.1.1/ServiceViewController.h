//
//  ServiceViewController.h
//  O2ODemo4.1.1
//
//  Created by 祝翔龙 on 15/12/1.
//  Copyright © 2015年 祝翔龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ServiceViewController : UIViewController<UIWebViewDelegate>
{
    UIWebView *webView;
    UIActivityIndicatorView *activityIndicatorView;
    UIImageView *loadImageView;
}
@property(strong, nonatomic)UIButton *btn;

@end

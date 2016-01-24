//
//  UserViewController.m
//  O2ODemo4.1.1
//
//  Created by 祝翔龙 on 15/12/1.
//  Copyright © 2015年 祝翔龙. All rights reserved.
//

#import "UserViewController.h"
#define WIDTH _btn.frame.size.width
#define HEIGHT _btn.frame.size.height
#define kScreenWidth [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height

@interface UserViewController ()

@end

@implementation UserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height/22, self.view.frame.size.width,self.view.frame.size.height/22*21)];
    webView.delegate = self;
    webView.scalesPageToFit = YES;
    [self.view addSubview:webView];
    
    NSURL *url = [NSURL URLWithString:@"telprompt://400-069-0315"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    
    loadImageView = [[UIImageView alloc]init];
    loadImageView.contentMode = UIViewContentModeCenter;
    loadImageView.frame = CGRectMake(187, 323, 10, 10);
    NSMutableArray *loadImageArray = [[NSMutableArray alloc]init];
    for(int i=1; i<=11; i++){
        UIImage *myImage = [UIImage imageNamed:[NSString stringWithFormat:@"00%d.tiff",i]];
        [loadImageArray addObject:myImage];
    }
    loadImageView.animationImages = loadImageArray;
    loadImageView.animationRepeatCount = 50;
    loadImageView.animationDuration = 1;
    NSLog(@"user");
    [self assisitivetouch];
}

-(void) webViewDidStartLoad:(UIWebView *)webView{
    [loadImageView startAnimating];
    [self.view addSubview:loadImageView];
}

-(void) webViewDidFinishLoad:(UIWebView *)webView{
    [loadImageView stopAnimating];
}

-(void) webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    UIAlertView *alterview = [[UIAlertView alloc] initWithTitle:@"" message:[error localizedDescription] delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alterview show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)assisitivetouch
{
    _btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _btn.frame = CGRectMake(0, 240, 50, 50);
    _btn.layer.masksToBounds = YES;
    [_btn setBackgroundImage:[UIImage imageNamed:@"as.png"] forState:UIControlStateNormal];
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(locationChange:)];
    pan.delaysTouchesBegan = YES;
    [_btn addGestureRecognizer:pan];
    [_btn addTarget:self action:@selector(doClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btn];
    
}

-(void)locationChange:(UIPanGestureRecognizer*)p
{
    CGPoint panPoint = [p locationInView:[[UIApplication sharedApplication] keyWindow]];
    if(p.state == UIGestureRecognizerStateChanged)
    {
        _btn.center = CGPointMake(panPoint.x, panPoint.y);
    }
    else if(p.state == UIGestureRecognizerStateEnded)
    {
        if(panPoint.x <= kScreenWidth/2)
        {
            if(panPoint.y <= 40+HEIGHT/2 && panPoint.x >= 20+WIDTH/2)
            {
                [UIView animateWithDuration:0.2 animations:^{
                    _btn.center = CGPointMake(panPoint.x, HEIGHT/2);
                }];
            }
            else if(panPoint.y >= kScreenHeight-HEIGHT/2-40 && panPoint.x >= 20+WIDTH/2)
            {
                [UIView animateWithDuration:0.2 animations:^{
                    _btn.center = CGPointMake(panPoint.x, kScreenHeight-HEIGHT/2);
                }];
            }
            else if (panPoint.x < WIDTH/2+15 && panPoint.y > kScreenHeight-HEIGHT/2)
            {
                [UIView animateWithDuration:0.2 animations:^{
                    _btn.center = CGPointMake(WIDTH/2, kScreenHeight-HEIGHT/2);
                }];
            }
            else
            {
                CGFloat pointy = panPoint.y < HEIGHT/2 ? HEIGHT/2 :panPoint.y;
                [UIView animateWithDuration:0.2 animations:^{
                    _btn.center = CGPointMake(WIDTH/2, pointy);
                }];
            }
        }
        else if(panPoint.x > kScreenWidth/2)
        {
            if(panPoint.y <= 40+HEIGHT/2 && panPoint.x < kScreenWidth-WIDTH/2-20 )
            {
                [UIView animateWithDuration:0.2 animations:^{
                    _btn.center = CGPointMake(panPoint.x, HEIGHT/2);
                }];
            }
            else if(panPoint.y >= kScreenHeight-40-HEIGHT/2 && panPoint.x < kScreenWidth-WIDTH/2-20)
            {
                [UIView animateWithDuration:0.2 animations:^{
                    _btn.center = CGPointMake(panPoint.x, 667-HEIGHT/2);
                }];
            }
            else if (panPoint.x > kScreenWidth-WIDTH/2-15 && panPoint.y < HEIGHT/2)
            {
                [UIView animateWithDuration:0.2 animations:^{
                    _btn.center = CGPointMake(kScreenWidth-WIDTH/2, HEIGHT/2);
                }];
            }
            else
            {
                CGFloat pointy = panPoint.y > kScreenHeight-HEIGHT/2 ? kScreenHeight-HEIGHT/2 :panPoint.y;
                [UIView animateWithDuration:0.2 animations:^{
                    _btn.center = CGPointMake(375-WIDTH/2, pointy);
                }];
            }
        }
    }
}

-(void)doClick:(UIButton*)sender
{
    UIStoryboard *story=[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    UIViewController *myview=[story instantiateViewControllerWithIdentifier:@"MyMainView"];
    [self presentModalViewController:myview animated:YES];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

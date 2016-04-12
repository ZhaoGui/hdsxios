//
//  YouhuixinxiView.m
//  haidaoshengxian_pro
//
//  Created by 猎暄 on 15/12/7.
//  Copyright © 2015年 猎暄. All rights reserved.
//

#import "YouhuixinxiView.h"

@interface YouhuixinxiView ()

@end

@implementation YouhuixinxiView
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIWebView *store=[[UIWebView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height/22, self.view.frame.size.width,self.view.frame.size.height/22*21)];
    NSURL *storeURL;
    storeURL=[[NSURL alloc]initWithString:@"http://www.haidaofresh.com/hdsx/mobile/article.php?id=3"];
    [store loadRequest:[NSURLRequest requestWithURL:storeURL]];
    // 加载网页
    store.delegate=self;
    
    [self.view addSubview:store];
    
    [self rollbutton];
}
-(void)rollbutton
{
    _btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _btn.frame = CGRectMake(0, 240, 50, 50);
    _btn.layer.borderWidth = 1;
    _btn.layer.borderColor = [UIColor orangeColor].CGColor;
    _btn.layer.cornerRadius = 25;
    _btn.layer.masksToBounds = YES;
    [_btn setTitle:@"首页" forState:UIControlStateDisabled];
    _btn.backgroundColor = [UIColor orangeColor];
    [_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_btn setTitle:@"首页" forState:UIControlStateNormal];
    [_btn addTarget:self action:@selector(dragMoving:withEvent: )forControlEvents: UIControlEventTouchDragInside];
    [_btn addTarget:self action:@selector(doClick:) forControlEvents:UIControlEventTouchUpInside];
    self.a=0;
    [self.view bringSubviewToFront:_btn];
    [self.view addSubview:_btn];
    
}
- (void)webViewDidStartLoad:(UIWebView *)webView {
    _image=[[UIImageView alloc]init];
    _image.frame=CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height);
    NSMutableArray *myImageArray=[[NSMutableArray alloc]init];
    for (int i=1; i<=2; i++) {
        UIImage *myImage=[UIImage imageNamed:[NSString stringWithFormat:@"jiazai%d.png",i]];
        [myImageArray addObject:myImage];
    }
    _image.animationImages=myImageArray;
    _image.animationRepeatCount=0;
    _image.animationDuration=1;
    
    [_image startAnimating];
    [self.view addSubview:_image];
    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [_image stopAnimating];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error
{
    [_image stopAnimating];
    UIImage *myImage=[UIImage imageNamed:@"jiazaishibai.png"];
    UIImageView *myImageView=[[UIImageView alloc]initWithImage:myImage];
    myImageView.frame=CGRectMake(30, 20, 100, 100);
    [self.view addSubview:myImageView];
    [self rollbutton];
    
    
    
}
- (void) dragMoving: (UIButton *) c withEvent:ev
{
    self.a=1;
    c.center = [[[ev allTouches] anyObject] locationInView:self.view];
    
}
-(void)doClick:(UIButton*)sender
{
    if (self.a==0)
    {
        UIStoryboard *story=[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        UIViewController *myview=[story instantiateViewControllerWithIdentifier:@"shouye"];
        [self presentModalViewController:myview animated:YES];
    }
    self.a=0;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

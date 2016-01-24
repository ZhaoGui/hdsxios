//
//  AssistiveTouch.m
//  O2ODemo4.1.1
//
//  Created by 祝翔龙 on 15/12/1.
//  Copyright © 2015年 祝翔龙. All rights reserved.
//

#import "AssistiveTouch.h"
#define WIDTH self.frame.size.width
#define HEIGHT self.frame.size.height
#define kScreenWidth [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height

@implementation AssistiveTouch

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}
-(id)initWithFrame:(CGRect)frame imageName:(NSString *)name
{
    if(self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor clearColor];
        self.windowLevel = UIWindowLevelAlert;
        [self makeKeyAndVisible];
        _imageView = [[UIImageView alloc]initWithFrame:(CGRect){0, 0,frame.size.width, frame.size.height}];
        _imageView.image = [UIImage imageNamed:name];
        _imageView.alpha = 0.3;
//        _button = [[UIButton alloc]initWithFrame:(CGRect){0,0,frame.size.width, frame.size.height}];
//        [_button setBackgroundImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
//        _button.alpha = 0.3;
//        [self addSubview:_button];
        [self addSubview:_imageView];
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(locationChange:)];
        pan.delaysTouchesBegan = YES;
        [self addGestureRecognizer:pan];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(click:)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

-(void)locationChange:(UIPanGestureRecognizer*)p
{
    CGPoint panPoint = [p locationInView:[[UIApplication sharedApplication] keyWindow]];
    if(p.state == UIGestureRecognizerStateBegan)
    {
        [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(changeColor) object:nil];
        _imageView.alpha = 0.8;
    }
    else if (p.state == UIGestureRecognizerStateEnded)
    {
        [self performSelector:@selector(changeColor) withObject:nil afterDelay:4.0];
    }
    if(p.state == UIGestureRecognizerStateChanged)
    {
        self.center = CGPointMake(panPoint.x, panPoint.y);
    }
    else if(p.state == UIGestureRecognizerStateEnded)
    {
        if(panPoint.x <= kScreenWidth/2)
        {
            if(panPoint.y <= 40+HEIGHT/2 && panPoint.x >= 20+WIDTH/2)
            {
                [UIView animateWithDuration:0.2 animations:^{
                    self.center = CGPointMake(panPoint.x, HEIGHT/2);
                }];
            }
            else if(panPoint.y >= kScreenHeight-HEIGHT/2-40 && panPoint.x >= 20+WIDTH/2)
            {
                [UIView animateWithDuration:0.2 animations:^{
                    self.center = CGPointMake(panPoint.x, kScreenHeight-HEIGHT/2);
                }];
            }
            else if (panPoint.x < WIDTH/2+15 && panPoint.y > kScreenHeight-HEIGHT/2)
            {
                [UIView animateWithDuration:0.2 animations:^{
                    self.center = CGPointMake(WIDTH/2, kScreenHeight-HEIGHT/2);
                }];
            }
            else
            {
                CGFloat pointy = panPoint.y < HEIGHT/2 ? HEIGHT/2 :panPoint.y;
                [UIView animateWithDuration:0.2 animations:^{
                    self.center = CGPointMake(WIDTH/2, pointy);
                }];
            }
        }
        else if(panPoint.x > kScreenWidth/2)
        {
            if(panPoint.y <= 40+HEIGHT/2 && panPoint.x < kScreenWidth-WIDTH/2-20 )
            {
                [UIView animateWithDuration:0.2 animations:^{
                    self.center = CGPointMake(panPoint.x, HEIGHT/2);
                }];
            }
            else if(panPoint.y >= kScreenHeight-40-HEIGHT/2 && panPoint.x < kScreenWidth-WIDTH/2-20)
            {
                [UIView animateWithDuration:0.2 animations:^{
                    self.center = CGPointMake(panPoint.x, 667-HEIGHT/2);
                }];
            }
            else if (panPoint.x > kScreenWidth-WIDTH/2-15 && panPoint.y < HEIGHT/2)
            {
                [UIView animateWithDuration:0.2 animations:^{
                    self.center = CGPointMake(kScreenWidth-WIDTH/2, HEIGHT/2);
                }];
            }
            else
            {
                CGFloat pointy = panPoint.y > kScreenHeight-HEIGHT/2 ? kScreenHeight-HEIGHT/2 :panPoint.y;
                [UIView animateWithDuration:0.2 animations:^{
                    self.center = CGPointMake(375-WIDTH/2, pointy);
                }];
            }
        }
    }
}

-(void)click:(UITapGestureRecognizer*)t
{
    _imageView.alpha = 0.8;
//    _button.alpha = 0.8;
    [self performSelector:@selector(changeColor) withObject:nil afterDelay:4.0];
    if(_assistiveDelegate && [_assistiveDelegate respondsToSelector:@selector(assistiveTocuhs)])
    {
        [_assistiveDelegate assistiveTocuhs];
    }
    
    NSLog(@"AssistiveTouch被点击");
    
//    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
//    UIViewController *myView = [story instantiateViewControllerWithIdentifier:@"MainView"];
//    [myView dismissModalViewControllerAnimated:YES];
    
//    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
//    [user setObject:@"click" forKey:@"clicked"];
    
    SeaFoodViewController *seaFoodView = [[SeaFoodViewController alloc]init];
    seaFoodView.disapear;
}
-(void)changeColor
{
    [UIView animateWithDuration:2.0 animations:^{
        _imageView.alpha = 0.3;
//        _button.alpha = 0.3;
    }];
}

@end

//
//  RootViewController.m
//  O2ODemo4.1.1
//
//  Created by 祝翔龙 on 15/12/1.
//  Copyright © 2015年 祝翔龙. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.png"]];
    
    UITapGestureRecognizer *seaFoodtapGesturRecognizer1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(openSeaFoodView)];
    [_seaFoodImage addGestureRecognizer:seaFoodtapGesturRecognizer1];
    _seaFoodImage.userInteractionEnabled = YES;

    UITapGestureRecognizer *favorabletapGesturRecognizer2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(openFavorableView)];
    [_favorableImage addGestureRecognizer:favorabletapGesturRecognizer2];
    _favorableImage.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *servicetapGesturRecognizer3 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(openServiceView)];
    [_serviceImage addGestureRecognizer:servicetapGesturRecognizer3];
    _serviceImage.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *userGesturRecognizer4 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(openUserView)];
    [_userImage addGestureRecognizer:userGesturRecognizer4];
    _userImage.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *explanGesturRecognizer5 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(openExplainView)];
    [_explainImage addGestureRecognizer:explanGesturRecognizer5];
    _explainImage.userInteractionEnabled = YES;
    
}

-(void)openFavorableView
{
    FavorableViewController *favorableView = [[FavorableViewController alloc]init];
    [self presentModalViewController:favorableView animated:YES];
}

-(void)openExplainView
{
    ExplainViewController *explainView = [[ExplainViewController alloc]init];
    [self presentModalViewController:explainView animated:YES];
}

-(void)openSeaFoodView
{
    SeaFoodViewController *seaFoodView = [[SeaFoodViewController alloc]init];
    [self presentModalViewController:seaFoodView animated:YES];
}

-(void)openServiceView
{
    ServiceViewController *serviceView = [[ServiceViewController alloc]init];
    [self presentModalViewController:serviceView animated:YES];
}

-(void)openUserView
{
    UserViewController *userView = [[UserViewController alloc]init];
    [self presentModalViewController:userView animated:YES];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end

//
//  UserGuideViewController.m
//  O2ODemo4.1.1
//
//  Created by 祝翔龙 on 15/12/3.
//  Copyright © 2015年 祝翔龙. All rights reserved.
//

#import "UserGuideViewController.h"

@interface UserGuideViewController ()

@end

@implementation UserGuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [NSThread sleepForTimeInterval:5.0];
    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"firstlaunch"]){
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstlaunch"];
        NSLog(@"第一次启动");
        [self initGuide];
    }
    else{
        NSLog(@"不是第一次启动");
        [self viewDidAppear:YES];
    }
    
}

-(void)viewDidAppear:(BOOL)animated{
    
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    UIViewController *myView = [story instantiateViewControllerWithIdentifier:@"MyMainView"];
    [self presentModalViewController:myView animated:YES];
    
//    [self initGuide];
}

-(void) initGuide{
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 375, 667)];
    [scrollView setContentSize:CGSizeMake(1125, 0)];
    [scrollView setPagingEnabled:YES];
    
    UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 375, 667)];
    [imageView1 setImage:[UIImage imageNamed:@"userguide1.jpg"]];
    [scrollView addSubview:imageView1];
    
    UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(375, 0, 375, 667)];
    [imageView2 setImage:[UIImage imageNamed:@"userguide2.jpg"]];
    [scrollView addSubview:imageView2];
    
    UIImageView *imageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(750, 0, 375, 667)];
    [imageView3 setImage:[UIImage imageNamed:@"userguide3.jpg"]];
    imageView3.userInteractionEnabled = YES;
    [scrollView addSubview:imageView3];
    
    UIButton *btn1 = [[UIButton alloc] init];
    btn1.tag = 1;
    btn1.frame = CGRectMake(117, 597, 150, 50);
    [btn1 setBackgroundImage:[UIImage imageNamed:@"join.png"] forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(gotoMain) forControlEvents:UIControlEventTouchUpInside];
    [imageView3 addSubview:btn1];
    
    [self.view addSubview:scrollView];
}

-(void)gotoMain{
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    UIViewController *myView = [story instantiateViewControllerWithIdentifier:@"MyMainView"];
    [self presentModalViewController:myView animated:YES];
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

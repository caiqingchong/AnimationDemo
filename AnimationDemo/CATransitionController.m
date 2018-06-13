//
//  CATransition.m
//  AnimationDemo
//
//  Created by 张张凯 on 2018/6/13.
//  Copyright © 2018年 TRS. All rights reserved.
//

#import "CATransitionController.h"

@interface CATransitionController ()
@property (nonatomic,retain) UIImageView *imageView;
@property(nonatomic,assign) int index;

@end

@implementation CATransitionController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.index=1;
    self.view.backgroundColor = [UIColor whiteColor];

    UIButton *but1 = [UIButton buttonWithType:UIButtonTypeCustom];
    but1.frame = CGRectMake(50, 400, 50, 50);
    but1.backgroundColor = [UIColor redColor];
    [but1 addTarget:self action:@selector(preOnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *but2 = [UIButton buttonWithType:UIButtonTypeCustom];
    but2.frame = CGRectMake(250, 400, 50, 50);
    but2.backgroundColor = [UIColor orangeColor];
    [but2 addTarget:self action:@selector(nextOnClick:) forControlEvents:UIControlEventTouchUpInside];

    
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    self.imageView.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:self.imageView];
    [self.view addSubview:but1];
    [self.view addSubview:but2];
}


- (void)preOnClick:(UIButton *)sender {
         self.index--;
         if (self.index<1) {
                 self.index=7;
             }
         self.imageView.image=[UIImage imageNamed: [NSString stringWithFormat:@"%d.jpg",self.index]];
    
         //创建核心动画
         CATransition *ca=[CATransition animation];
         //告诉要执行什么动画
         //设置过度效果
         ca.type=@"cube";
         //设置动画的过度方向（向左）
         ca.subtype=kCATransitionFromLeft;
         //设置动画的时间
         ca.duration=2.0;
         //添加动画
         [self.imageView.layer addAnimation:ca forKey:nil];
     }

- (void)nextOnClick:(UIButton *)sender {
         self.index++;
         if (self.index>7) {
                 self.index=1;
             }
             self.imageView.image=[UIImage imageNamed: [NSString stringWithFormat:@"%d.jpg",self.index]];
    
         //1.创建核心动画
         CATransition *ca=[CATransition animation];
    
         //1.1告诉要执行什么动画
         //1.2设置过度效果
         ca.type=@"cube";
         //1.3设置动画的过度方向（向右）
         ca.subtype=kCATransitionFromRight;
         //1.4设置动画的时间
         ca.duration=2.0;
         //1.5设置动画的起点
         ca.startProgress=0.5;
         //1.6设置动画的终点
     //    ca.endProgress=0.5;
    
         //2.添加动画
         [self.imageView.layer addAnimation:ca forKey:nil];
     }

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


@end

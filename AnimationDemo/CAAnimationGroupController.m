//
//  CAAnimationGroup.m
//  AnimationDemo
//
//  Created by 张张凯 on 2018/6/13.
//  Copyright © 2018年 TRS. All rights reserved.
//

#import "CAAnimationGroupController.h"

@interface CAAnimationGroupController ()<CAAnimationDelegate>
@property (nonatomic,retain) UIImageView *imageView;

@end

@implementation CAAnimationGroupController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    self.imageView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.imageView];
    
    
    // 平移动画
    CABasicAnimation *a1 = [CABasicAnimation animation];
    a1.keyPath = @"transform.translation.y";
    a1.toValue = @(100);
    // 缩放动画
    CABasicAnimation *a2 = [CABasicAnimation animation];
    a2.keyPath = @"transform.scale";
    a2.toValue = @(0.0);
    // 旋转动画
    CABasicAnimation *a3 = [CABasicAnimation animation];
    a3.keyPath = @"transform.rotation";
    a3.toValue = @(M_PI_2);
    
    // 组动画
    CAAnimationGroup *groupAnima = [CAAnimationGroup animation];
    
    groupAnima.animations = @[a1, a2, a3];
    
    //设置组动画的时间
    groupAnima.duration = 2;
    groupAnima.fillMode = kCAFillModeForwards;
    groupAnima.removedOnCompletion = NO;
    
    [self.imageView.layer addAnimation:groupAnima forKey:nil];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
@end


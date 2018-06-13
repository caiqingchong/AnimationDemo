
//
//  CAKeyframeAnimation.m
//  AnimationDemo
//
//  Created by 张张凯 on 2018/6/13.
//  Copyright © 2018年 TRS. All rights reserved.
//

#import "CAKeyframeAnimationController.h"

@interface CAKeyframeAnimationController ()<CAAnimationDelegate>
@property (nonatomic,retain) UIImageView *imageView;

@end

@implementation CAKeyframeAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];

    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    self.imageView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.imageView];
    //1.创建核心动画
    CAKeyframeAnimation *keyAnima=[CAKeyframeAnimation animation];
    //平移
    keyAnima.keyPath=@"position";
    //1.1告诉系统要执行什么动画
    NSValue *value1=[NSValue valueWithCGPoint:CGPointMake(100, 100)];
    NSValue *value2=[NSValue valueWithCGPoint:CGPointMake(200, 100)];
    NSValue *value3=[NSValue valueWithCGPoint:CGPointMake(200, 200)];
    NSValue *value4=[NSValue valueWithCGPoint:CGPointMake(100, 200)];
    NSValue *value5=[NSValue valueWithCGPoint:CGPointMake(100, 100)];
    keyAnima.values=@[value1,value2,value3,value4,value5];
    //1.2设置动画执行完毕后，不删除动画
    keyAnima.removedOnCompletion=NO;
    //1.3设置保存动画的最新状态
    keyAnima.fillMode=kCAFillModeForwards;
    //1.4设置动画执行的时间
    keyAnima.duration=4.0;
    //1.5设置动画的节奏
    keyAnima.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    //设置代理，开始—结束
    keyAnima.delegate=self;
    //2.添加核心动画
    [self.imageView.layer addAnimation:keyAnima forKey:nil];

}

//第二种方式
//-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
// {
//         //1.创建核心动画
//         CAKeyframeAnimation *keyAnima=[CAKeyframeAnimation animation];
//         //平移
//         keyAnima.keyPath=@"position";
//         //1.1告诉系统要执行什么动画
//         //创建一条路径
//         CGMutablePathRef path=CGPathCreateMutable();
//         //设置一个圆的路径
//         CGPathAddEllipseInRect(path, NULL, CGRectMake(150, 100, 100, 100));
//         keyAnima.path=path;
//    
//         //有create就一定要有release
//         CGPathRelease(path);
//         //1.2设置动画执行完毕后，不删除动画
//         keyAnima.removedOnCompletion=NO;
//         //1.3设置保存动画的最新状态
//         keyAnima.fillMode=kCAFillModeForwards;
//         //1.4设置动画执行的时间
//         keyAnima.duration=5.0;
//         //1.5设置动画的节奏
//         keyAnima.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    
//         //设置代理，开始—结束
//         keyAnima.delegate=self;
//         //2.添加核心动画
//         [self.imageView.layer addAnimation:keyAnima forKey:nil];
//     }

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

@end

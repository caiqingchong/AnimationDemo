//
//  ViewController.m
//  AnimationDemo
//
//  Created by 张张凯 on 2018/6/13.
//  Copyright © 2018年 TRS. All rights reserved.
//

#import "ViewController.h"

#import "CABasicAnimationController.h"
#import "CAKeyframeAnimationController.h"
#import "CAAnimationGroupController.h"
#import "CATransitionController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource> {
    NSArray* data;
}

@end

@implementation ViewController

//使用表来分别显示

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    data = @[@"CABasicAnimation",@"CAKeyframeAnimation",@"CAAnimationGroup",@"CATransition"];
    UITableView *tab = [[UITableView alloc]initWithFrame:self.view.bounds style:0];
    tab.delegate = self;
    tab.dataSource = self;
    tab.rowHeight = 80;
    tab.separatorColor = [UIColor orangeColor];
    [self.view addSubview:tab];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return data.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"cell";
    
    UITableViewCell *cell = (UITableViewCell*)[tableView  dequeueReusableCellWithIdentifier:CellIdentifier];
    //创建cell
      if (cell == nil) {
               cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
           //cell的四种样式
        //UITableViewCellStyleDefault,       只显示图片和标题
           //UITableViewCellStyleValue1,        显示图片，标题和子标题（子标题在右边）
      //UITableViewCellStyleValue2,        标题和子标题
       //UITableViewCellStyleSubtitle       显示图片，标题和子标题（子标题在下边）
   
        }
    cell.textLabel.text = data[indexPath.row];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"点击的动画为：%@",data[indexPath.row]);
    
    switch (indexPath.row) {
        case 0:
            [self presentViewController:[CABasicAnimationController new] animated:YES completion:nil];
            break;
        case 1:
            [self presentViewController:[CAKeyframeAnimationController new] animated:YES completion:nil];

            break;
        case 2:
            [self presentViewController:[CAAnimationGroupController new] animated:YES completion:nil];

            break;
        case 3:
            [self presentViewController:[CATransitionController new] animated:YES completion:nil];

            
            break;
            
        default:
            break;
    }
    
    
}


@end

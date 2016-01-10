//
//  VerticallyViewController.m
//  DSMasonryDemo
//
//  Created by YMY on 15/8/14.
//  Copyright (c) 2015年 dasheng. All rights reserved.
//

#import "VerticallyViewController.h"
#import "Masonry.h"

@implementation VerticallyViewController

-(void)viewDidLoad{
    
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    //竖直方向上，顶部和底部位置定好，其他等间隙排放
    UIView *superView1 = [[UIView alloc] initWithFrame:CGRectMake(10, 70, (self.view.frame.size.width-30)/2, 450)];
    superView1.backgroundColor = [UIColor redColor];
    [self.view addSubview:superView1];
    
    UILabel *v2 = [UILabel new];
    v2.backgroundColor = [UIColor blackColor];
    v2.text = @"我睡得比猫晚起得比鸡还早,工作在拼体力武器得用大脑,左手的PRD 右手的产品稿,什么才是你想要我每天在烦恼";
    v2.textColor = [UIColor whiteColor];
    v2.numberOfLines = 0;
    
    UILabel *v3 = [UILabel new];
    v3.backgroundColor = [UIColor blackColor];
    v3.text = @"邮件又来催催催,产品开发累累累,你们永远对对对";
    v3.textColor = [UIColor whiteColor];
    v3.numberOfLines = 1;
    
    UIView *v4 = [UIView new];
    v4.backgroundColor = [UIColor blackColor];
    
    [superView1 addSubview:v2];
    [superView1 addSubview:v3];
    [superView1 addSubview:v4];
    
    [v2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@[v3,v4]);
        make.left.mas_equalTo(10);
        make.width.equalTo(@100);
    }];
    
    [v3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@150);
//        make.left.equalTo(superView1).offset(10);
    }];
    
    [v4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(80, 150));
    }];
// Under the vertical direction At the bottom of the distance from the top of the distance
    
//    [superView1 distributeSpacingVerticallyWith:@[v2,v3,v4] topGap:20 bottomGap:20];


    
 // Horizontal spacing, etc
        [superView1 distributeSpacingVerticallyWith:@[v2,v3,v4]];
    
    
    //竖直方向上，等间隙排放
    UIView *superView2 = [[UIView alloc] initWithFrame:CGRectMake((self.view.frame.size.width-30)/2+20, 70, (self.view.frame.size.width-30)/2, 450)];
    superView2.backgroundColor = [UIColor redColor];
    [self.view addSubview:superView2];
    
    UILabel *v5 = [UILabel new];
    v5.backgroundColor = [UIColor blackColor];
    v5.text = @"我睡得比猫晚起得比鸡还早,工作在拼体力武器得用大脑,左手的PRD 右手的产品稿,什么才是你想要我每天在烦恼";
    v5.textColor = [UIColor whiteColor];
    v5.numberOfLines = 0;
    
    UILabel *v6 = [UILabel new];
    v6.backgroundColor = [UIColor blackColor];
    v6.text = @"邮件又来催催催,产品开发累累累,你们永远对对对";
    v6.textColor = [UIColor whiteColor];
    v6.numberOfLines = 2;
    
    UIView *v7 = [UIView new];
    v7.backgroundColor = [UIColor blackColor];
    
    [superView2 addSubview:v5];
    [superView2 addSubview:v6];
    [superView2 addSubview:v7];
    
    [v5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@[v6,v7]);
        make.width.equalTo(@100);
    }];
    
    [v6 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@150);
        make.left.equalTo(superView2).offset(10);
    }];
    
    [v7 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(80, 150));
    }];
    
    [superView2 distributeSpacingVerticallyWith:@[v5,v6,v7]];
    

}

@end

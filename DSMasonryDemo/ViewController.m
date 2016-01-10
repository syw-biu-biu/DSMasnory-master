//
//  ViewController.m
//  DSMasonryDemo
//
//  Created by YMY on 15/8/14.
//  Copyright (c) 2015年 dasheng. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "VerticallyViewController.h"
#import "HorizontallyViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>{
    
    NSArray *_dataArray;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dataArray = @[@"HorizontallySpace",@"VerticallySpace"];

    UITableView *_table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];

    _table.delegate = self;
    _table.dataSource = self;
    [self.view addSubview:_table];
    
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    

    return [_dataArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString * cellName = @"UITableViewCell";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
    }
    [cell.textLabel setTextColor:[UIColor blackColor]];
        
    cell.textLabel.text = [_dataArray objectAtIndex:indexPath.row];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.row) {
        case 0:{
            HorizontallyViewController *VC = [[HorizontallyViewController alloc] init];
            [self.navigationController pushViewController:VC animated:YES];
        }
            break;
        case 1:{
            VerticallyViewController *VC = [[VerticallyViewController alloc] init];
            [self.navigationController pushViewController:VC animated:YES];
        }
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  ThirdViewController.m
//  basic exercise
//
//  Created by cocoa on 2017/6/16.
//  Copyright © 2017年 wangbingyan. All rights reserved.
//

#import "ThirdViewController.h"
#import <Masonry.h>
#import "CustomTableViewCell.h"

#define cellDentifier @"cell_id"
#define ColorHEX(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface ThirdViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(strong,nonatomic) UITableView *table;
@property(strong,nonatomic) NSMutableArray *dataArray1;
@property(strong,nonatomic) NSMutableArray *dataArray2;
@property(strong,nonatomic) NSMutableArray *dataArray3;
@property(strong,nonatomic) NSMutableArray *titleArray;
@property(strong,nonatomic) NSMutableArray* dataArray;

@end

@implementation ThirdViewController

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _table = [[UITableView alloc] init];
    [_table registerClass:[CustomTableViewCell class] forCellReuseIdentifier:cellDentifier];
    [_table setDelegate:self];
    [_table setDataSource:self];
    [self.view addSubview:_table];
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
    [headerView setBackgroundColor:ColorHEX(0x008866)];
    UILabel *lable1 = [[UILabel alloc] init];
    [lable1 setText:@"table header"];
    [headerView addSubview:lable1];
    
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
    [footerView setBackgroundColor:ColorHEX(0x008866)];
    UILabel *lable2 = [[UILabel alloc] init];
    [lable2 setText:@"table footer"];
    [footerView addSubview:lable2];
    
    [_table setTableHeaderView:headerView];
    [_table setTableFooterView:footerView];
    
    [lable1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(headerView);
    }];
    
    [lable2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(footerView);
    }];
    
    [_table mas_makeConstraints:^(MASConstraintMaker* make){
        make.edges.equalTo(self.view);
    }];
    
    _dataArray1 = [[NSMutableArray alloc] initWithObjects:@"rect",@"circle",@"triangle", nil];
    _dataArray2 = [[NSMutableArray alloc] initWithObjects:@"white", @"black", nil];
    _dataArray3 = [[NSMutableArray alloc] initWithObjects:@"left", @"right",@"top",@"bottom" ,nil];
    _titleArray = [[NSMutableArray alloc] initWithObjects:@"shape", @"color",@"direction", nil];
    _dataArray = [[NSMutableArray alloc] initWithObjects:_dataArray1,_dataArray2,_dataArray3, nil];
    
}

#pragma mark - UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [_titleArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [[_dataArray objectAtIndex:section] count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
        
    CustomTableViewCell *cell = (CustomTableViewCell*) [tableView dequeueReusableCellWithIdentifier:cellDentifier forIndexPath:indexPath];
    [cell setTitleText:[[_dataArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row]];
    [cell setLableText:[NSString stringWithFormat:@"indexpath is:%ld,%ld",indexPath.section,indexPath.row]];
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"you clicked:" message:[[_dataArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row] preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:cancelAction];
    [self presentViewController:alert animated:YES completion:nil];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [self.delegate print];
}

- (UIView*) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
    
    [view setBackgroundColor:[UIColor orangeColor]];//改变标题的颜色，也可用图片
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 100, 30)];
    
    label.textColor = [UIColor blackColor];
    
    label.text = [_titleArray objectAtIndex:section];
    [view addSubview:label];
    return view;
    
}

@end

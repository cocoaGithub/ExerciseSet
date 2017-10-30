//
//  ViewController.m
//  TableReloadCurrent
//
//  Created by cocoa on 2017/10/30.
//  Copyright © 2017年 wangbingyan. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>
@property(strong, nonatomic) UITableView *table;
@property(assign, nonatomic) CGPoint offset;
@property(assign, nonatomic) NSInteger totalCount;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _offset = CGPointMake(0.0f, 0.0f);
    _table = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:_table];
    [_table registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell_id"];
    _table.delegate = self;
    _table.dataSource = self;
    _totalCount = 0;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self requestDataCompleted:^(NSInteger x) {
        self.totalCount = x;
        [self.table reloadData];
        
//        如果在reloadData后需要立即需要滚动tableview，那么，直接在reloadData后执行代码是有可能出问题的。
//        reloadData并不会等待tableview更新结束后才返回，而是立即返回，而reset contentOffset延迟到reloadData结束后执行
        [self.table layoutIfNeeded];
        //刷新完成
        [self.table setContentOffset:self.offset animated:NO];
        
        // or
        //reloadDate会在主队列执行，而dispatch_get_main_queue会等待机会，直到主队列空闲才执行。
//        dispatch_async(dispatch_get_main_queue(), ^{
//            //刷新完成
//            [self.table setContentOffset: self.offset animated:NO];
//        });
        
        NSLog(@"reset table contentOffset");
    }];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)requestDataCompleted:(void(^)(NSInteger))block {
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    double delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        if (block) {
            block(rand()%30+20);
        }
    });
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailViewController *detailVC = [[DetailViewController alloc] initWithTitle: [NSString stringWithFormat:@"page%ld", (long)indexPath.row]];
    [self.navigationController pushViewController:detailVC animated:YES];
}

#pragma mark - UITableViewDatasource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell_id"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell_id"];
    }
    
    [cell.textLabel setText:[NSString stringWithFormat:@"index:%ld",(long)indexPath.row]];
   
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.totalCount;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    self.offset = scrollView.contentOffset;
    NSLog(@"table DidEndDecelerating");
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    self.offset = scrollView.contentOffset;
    NSLog(@"table DidEndDragging");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

//
//  DetailViewController.m
//  TableReloadCurrent
//
//  Created by cocoa on 2017/10/30.
//  Copyright © 2017年 wangbingyan. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property(copy, nonatomic) NSString *title;
@end

@implementation DetailViewController

- (id)initWithTitle:(NSString *)title {
    if (self = [super init]) {
        self.title = title;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:self.title];
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

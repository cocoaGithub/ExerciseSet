//
//  FirstViewController.m
//  basic exercise
//
//  Created by cocoa on 2017/5/27.
//  Copyright © 2017年 wangbingyan. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"

#define CELL_ID @"cell_id"

@interface FirstViewController ()

@property (nonatomic,strong) UITextField *nameText;
@property (strong,nonatomic) UISwitch *switchBtn;
@property (strong,nonatomic) UISearchBar *searchBar;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height *1.5);
    [self.view addSubview:scrollView];
    
    UIImageView * imageview = [[UIImageView alloc] initWithFrame:CGRectMake(15, 20, self.view.frame.size.width - 30, 120)];
    [imageview setImage:[UIImage imageNamed:@"test_image"]];
    [scrollView addSubview:imageview];
    
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 200, 80, 30)];
    nameLabel.text = @"name :";
    nameLabel.textAlignment = NSTextAlignmentLeft;
    [scrollView addSubview:nameLabel];
    
    UILabel *numberLabel = [[UILabel alloc] initWithFrame:CGRectMake(nameLabel.frame.origin.x, 250, nameLabel.frame.size.width, nameLabel.frame.size.height)];
    numberLabel.text = @"number :";
    numberLabel.textAlignment = NSTextAlignmentLeft;
    [scrollView addSubview:numberLabel];
    
    _nameText = [[UITextField alloc] initWithFrame:CGRectMake(105, nameLabel.frame.origin.y, self.view.frame.size.width - 105-15, nameLabel.frame.size.height)];
    _nameText.placeholder = @"input name";
    _nameText.borderStyle = UITextBorderStyleLine;
    [_nameText addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [scrollView addSubview:_nameText];
    
    UITextField *numberText = [[UITextField alloc] initWithFrame:CGRectMake(_nameText.frame.origin.x, numberLabel.frame.origin.y, _nameText.frame.size.width, _nameText.frame.size.height)];
    numberText.placeholder = @"input a number";
    numberText.borderStyle = UITextBorderStyleLine;
    [scrollView addSubview:numberText];
    
    UIButton *signBtn = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width-100)/2, 310, 100, 30)];
    signBtn.backgroundColor = [UIColor orangeColor];
    [signBtn setTitle:@"Sign in" forState:UIControlStateNormal];
    signBtn.layer.cornerRadius = 15;
    signBtn.layer.masksToBounds = YES;
    [signBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:signBtn];
    
    NSArray *segItems = @[@"switch",@"search"];
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:segItems];
    segment.frame = CGRectMake(15, 400, 120, 30);
    [segment setSelectedSegmentIndex:0];
    [segment addTarget:self action:@selector(toggleChanged:) forControlEvents:UIControlEventValueChanged];
    [scrollView addSubview:segment];
    
    _switchBtn = [[UISwitch alloc] initWithFrame:CGRectMake(15,450,100,30)];
    [scrollView addSubview:_switchBtn];
    [_switchBtn setHidden:NO];
    
    _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(15, 450, 180, 30)];
    [_searchBar setBackgroundColor:[UIColor grayColor]];
    [_searchBar setBarStyle:UIBarStyleBlack];
    [scrollView addSubview:_searchBar];
    [_searchBar setHidden:YES];
    
    UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(15,510,50,50)];
    [indicatorView setColor:[UIColor redColor]];
    [indicatorView setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    [scrollView addSubview:indicatorView];
    [indicatorView startAnimating];
    
    UIButton *nextPage = [[UIButton alloc] initWithFrame:CGRectMake(15, 600, 100, 30)];
    [nextPage setTitle:@"next" forState:UIControlStateNormal];
    [nextPage setBackgroundColor:[UIColor orangeColor]];
    [scrollView addSubview:nextPage];
    nextPage.layer.cornerRadius = 7;
    nextPage.layer.masksToBounds = YES;
    [nextPage addTarget:self action:@selector(goNextPage) forControlEvents:UIControlEventTouchUpInside];
}

- (void)goNextPage {
    SecondViewController *nextVC = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:nextVC animated:YES];
}


- (void) toggleChanged:(UISegmentedControl*) sender{
    if (sender.selectedSegmentIndex == 0) {
        _switchBtn.hidden = NO;
        _searchBar.hidden = YES;
    }else{
        _switchBtn.hidden = YES;
        _searchBar.hidden = NO;
    }
}

- (void) btnClick:(UIButton *)sender{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"are you sure?" message:@"you will sign in" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:cancelAction];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void) textFieldDoneEditing:(UITextField*) sender{
    [sender resignFirstResponder];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

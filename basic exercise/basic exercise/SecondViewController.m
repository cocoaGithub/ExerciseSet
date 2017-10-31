//
//  SecondViewController.m
//  basic exercise
//
//  Created by cocoa on 2017/6/5.
//  Copyright © 2017年 wangbingyan. All rights reserved.
//

#import "SecondViewController.h"
#import <Masonry.h>
#import "ThirdViewController.h"
#import "CustomView.h"
#import "CustomViewDraw.h"

@interface SecondViewController ()

@property (nonatomic,strong) UITextField *nameText;
@property (strong,nonatomic) UISearchBar *searchBar;
@property (strong,nonatomic) CustomView *customView;
@property(strong,nonatomic) CustomViewDraw *drawView;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    [self.view addSubview:scrollView];
    
    UIImageView * imageview = [[UIImageView alloc] init];
    [imageview setImage:[UIImage imageNamed:@"test_image"]];
    [scrollView addSubview:imageview];
    
    [imageview setUserInteractionEnabled:YES];
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imgClicked:)];
    [imageview addGestureRecognizer:singleTap];
    
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.text = @"name:";
    nameLabel.textAlignment = NSTextAlignmentLeft;
    [scrollView addSubview:nameLabel];
    
    UILabel *numberLabel = [[UILabel alloc] init];
    numberLabel.text = @"number:";
    numberLabel.textAlignment = NSTextAlignmentLeft;
    [scrollView addSubview:numberLabel];
    
    _nameText = [[UITextField alloc] init];
    _nameText.placeholder = @"input name";
    _nameText.borderStyle = UITextBorderStyleLine;
    [_nameText addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [scrollView addSubview:_nameText];
    
    UITextField *numberText = [[UITextField alloc] init];
    numberText.placeholder = @"input a number";
    numberText.borderStyle = UITextBorderStyleLine;
    [scrollView addSubview:numberText];
    
    UIButton *signBtn = [[UIButton alloc] init];
    signBtn.backgroundColor = [UIColor orangeColor];
    [signBtn setTitle:@"Sign in" forState:UIControlStateNormal];
    signBtn.layer.cornerRadius = 15;
    signBtn.layer.masksToBounds = YES;
    
    [signBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [scrollView addSubview:signBtn];
    
    NSArray *segItems = @[@"custom",@"draw"];
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:segItems];
    [segment setSelectedSegmentIndex:0];
    [segment addTarget:self action:@selector(toggleChanged:) forControlEvents:UIControlEventValueChanged];
    [scrollView addSubview:segment];
    
    _customView = [[CustomView alloc] init];
    [scrollView addSubview:_customView];
    [_customView setHidden:NO];
    [_customView setLableText:@"custom view"];
    
    _searchBar = [[UISearchBar alloc] init];
    [_searchBar setBackgroundColor:[UIColor grayColor]];
    [_searchBar setBarStyle:UIBarStyleBlack];
    [scrollView addSubview:_searchBar];
    [_searchBar setHidden:YES];
    
    _drawView = [[CustomViewDraw alloc] init];
    [_drawView setBackgroundColor:[UIColor clearColor]];
    [scrollView addSubview:_drawView];
    [_drawView setHidden:YES];
    
    UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] init];
    [indicatorView setColor:[UIColor redColor]];
    [indicatorView setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    [scrollView addSubview:indicatorView];
    [indicatorView startAnimating];
    
    UIButton *nextPage = [[UIButton alloc] init];
    [nextPage setTitle:@"next" forState:UIControlStateNormal];
    [nextPage setBackgroundColor:[UIColor orangeColor]];
    [scrollView addSubview:nextPage];
    nextPage.layer.cornerRadius = 7;
    nextPage.layer.masksToBounds = YES;
    [nextPage addTarget:self action:@selector(goNextPage) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *testBtn = [[UIButton alloc] init];
    [testBtn setTitle:@"test" forState:UIControlStateNormal];
    [testBtn setBackgroundColor:[UIColor redColor]];
    [scrollView addSubview:testBtn];

    
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@15);
        make.top.equalTo(scrollView).offset(20);
        make.right.equalTo(self.view).offset(-15);
        make.height.mas_equalTo(120);
    }];
    
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(15);
        make.top.equalTo(imageview.mas_bottom).offset(60);
        make.size.mas_equalTo(CGSizeMake(80, 30));
    }];
   
    [_nameText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(nameLabel.mas_right).offset(10);
        make.centerY.height.equalTo(nameLabel);
        make.right.equalTo(imageview);
    }];
    
    [numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(nameLabel);
        make.top.equalTo(nameLabel.mas_bottom).offset(20);
        make.size.equalTo(nameLabel);
    }];
    
    [numberText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.width.height.equalTo(_nameText);
        make.centerY.equalTo(numberLabel);
    }];
    
    [signBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(scrollView);
        make.top.equalTo(numberLabel.mas_bottom).offset(30);
        make.size.mas_equalTo(CGSizeMake(100, 30));
    }];
    
    [segment mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(scrollView).offset(15);
        make.top.equalTo(signBtn.mas_bottom).offset(60);
        make.size.mas_equalTo(CGSizeMake(120, 30));
    }];
    
    [_customView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        make.top.equalTo(segment.mas_bottom).offset(20);
        make.width.equalTo(@120);
        make.height.equalTo(@120);
    }];
    
    [_searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@15);
        make.top.equalTo(segment.mas_bottom).offset(20);
        make.size.mas_equalTo(CGSizeMake(120, 40));
    }];
    
    [_drawView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        make.top.equalTo(segment.mas_bottom).offset(20);
        make.width.equalTo(@120);
        make.height.equalTo(@120);
    }];
    
    [indicatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@15);
        make.top.equalTo(_customView.mas_bottom).offset(30);
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    
    [nextPage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@15);
        make.top.equalTo(indicatorView.mas_bottom).offset(40);
        make.size.mas_equalTo(CGSizeMake(100, 30));
    }];
    
    [testBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@15);
        make.top.equalTo(nextPage.mas_bottom).offset(30);
        make.size.mas_equalTo(CGSizeMake(100, 40));
    }];
    
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.bottom.equalTo(testBtn.mas_bottom).offset(50);
    }];
}

- (void)goNextPage {
    ThirdViewController *thirdVC = [[ThirdViewController alloc] init];
    [self.navigationController pushViewController:thirdVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) toggleChanged:(UISegmentedControl*) sender{
    if (sender.selectedSegmentIndex == 0) {
        _customView.hidden = NO;
//        _searchBar.hidden = NO;
        _drawView.hidden = YES;
    }else{
        _customView.hidden = YES;
//        _searchBar.hidden = YES;
        _drawView.hidden = NO;
    }
}

- (void) btnClick:(UIButton *)sender{
    NSLog(@"image clicked");
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"are you sure?" message:@"you will sign in" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:cancelAction];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)imgClicked:(UITapGestureRecognizer *)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"you clicked image" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:cancelAction];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void) textFieldDoneEditing:(UITextField*) sender{
    [sender resignFirstResponder];
}
@end

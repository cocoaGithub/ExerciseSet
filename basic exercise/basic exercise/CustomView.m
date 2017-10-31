//
//  CustomView.m
//  basic exercise
//
//  Created by cocoa on 2017/6/16.
//  Copyright © 2017年 wangbingyan. All rights reserved.
//

#import "CustomView.h"
#import <Masonry.h>

@interface CustomView()

@property (strong,nonatomic) UIImageView *img;
@property (strong,nonatomic) UILabel *lable;

@end

@implementation CustomView 

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"test_image"]];
        [self addSubview:_img];
        
        _lable = [[UILabel alloc] init];
        [_lable setTextAlignment:NSTextAlignmentCenter];
        [self addSubview:_lable];
        
        [_img mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.bottom.equalTo(self);
        }];
        
        [_lable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self);
            make.bottom.equalTo(@-10);
        }];
    }
    
    return self;
}

- (void)setLableText:(NSString *)text {
    [_lable setText:text];
}

@end

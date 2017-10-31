//
//  CustomTableViewCell.m
//  basic exercise
//
//  Created by cocoa on 2017/6/16.
//  Copyright © 2017年 wangbingyan. All rights reserved.
//

#import "CustomTableViewCell.h"
#import <Masonry.h>

@interface CustomTableViewCell()

@property (strong,nonatomic) UIImageView *img;
@property (strong,nonatomic) UILabel *lable;
@property (strong,nonatomic) UILabel *title;


@end
@implementation CustomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"test_image"]];
        [self addSubview:_img];
        
        _title = [[UILabel alloc] init];
        [_title setTextAlignment:NSTextAlignmentLeft];
        [_title setFont:[UIFont systemFontOfSize:16]];
        [self addSubview:_title];
        
        _lable = [[UILabel alloc] init];
        [_lable setTextAlignment:NSTextAlignmentLeft];
        [_lable setFont:[UIFont systemFontOfSize:14]];
        [self addSubview:_lable];
        
        [_img mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(self).offset(5);
            make.width.equalTo(@60);
            make.bottom.equalTo(@-5);
        }];
        
        [_title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_img.mas_right).offset(10);
            make.right.equalTo(self).offset(-15);
            make.top.equalTo(_img);
        }];
        
        [_lable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(_title);
            make.bottom.equalTo(_img).offset(-5);
        }];
    }
    return self;
}

- (void) setTitleText:(NSString *)text {
    [_title setText:text];
}

- (void)setLableText:(NSString *)text {
    [_lable setText:text];
}


@end

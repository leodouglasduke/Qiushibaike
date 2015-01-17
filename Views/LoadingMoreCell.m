//
//  LoadingMoreCell.m
//  Qiushibaike
//
//  Created by DukeMou on 15/1/17.
//  Copyright (c) 2015年 河南蓝鸥科技有限公司. All rights reserved.
//

#import "LoadingMoreCell.h"

@interface LoadingMoreCell ()

@property (nonatomic, retain) UIActivityIndicatorView *indicator;
@property (nonatomic, retain) UILabel *titleLabel;

@end

@implementation LoadingMoreCell

- (void)dealloc {
    [_indicator release];
    [_titleLabel release];
    [super dealloc];
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        self.titleLabel = [[[UILabel alloc] initWithFrame:self.bounds] autorelease];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_titleLabel];
    }
    return _titleLabel;
}

- (UIActivityIndicatorView *)indicator {
    if (!_indicator) {
        self.indicator = [[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray] autorelease];
        CGRect frame = CGRectZero;
        frame.origin.x = 100;
        frame.origin.y = 20;
        _indicator.frame = frame;
        [self.contentView addSubview:_indicator];
    }
    return _indicator;
}

- (void)startAnimating {
    self.titleLabel.text = @"正在加载中...";
    [self.indicator startAnimating];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

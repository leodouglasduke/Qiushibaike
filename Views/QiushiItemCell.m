//
//  QiushiItemCell.m
//  Qiushibaike
//
//  Created by DukeMou on 15/1/15.
//  Copyright (c) 2015年 河南蓝鸥科技有限公司. All rights reserved.
//

#import "QiushiItemCell.h"
#import "UIImageView+WebCache.h"

#define kScreenBounds ([[UIScreen mainScreen] bounds])


@interface QiushiItemCell ()

@property (nonatomic, retain) UIImageView *userAvatar;
@property (nonatomic, retain) UILabel *nameLabel;
@property (nonatomic, retain) UILabel *contentLabel;
@property (nonatomic, retain) UILabel *commentCountLabel;
@property (nonatomic, retain) UIButton *upButton;
@property (nonatomic, retain) UIButton *downButton;
@property (nonatomic, retain) UIButton *commentButton;
@property (nonatomic, retain) UIButton *shareButton;


@end

@implementation QiushiItemCell

- (void)dealloc {
    [_userAvatar release];
    [_nameLabel release];
    [_contentLabel release];
    [_commentCountLabel release];
    [_upButton release];
    [_downButton release];
    [_commentButton release];
    [_shareButton release];
    [super dealloc];
}

- (UIButton *)upButton {
    if (!_upButton) {
        self.upButton = [UIButton buttonWithType:UIButtonTypeCustom];
        CGRect frame = CGRectMake(0, 0, 0, 0);
        UIImage *normal = [UIImage imageNamed:@"icon_for.png"];
        UIImage *highlight = [UIImage imageNamed:@"icon_for_active.png"];
        frame.size = normal.size;
        _upButton.frame = frame;
        [_upButton setImage:normal forState:UIControlStateNormal];
        [_upButton setImage:highlight forState:UIControlStateHighlighted];
        [self.contentView addSubview:_upButton];
    }
    return _upButton;
}

- (UIButton *)downButton {
    if (!_downButton) {
        self.downButton = [UIButton buttonWithType:UIButtonTypeCustom];
        CGRect frame = CGRectMake(78, 0, 0, 0);
        UIImage *normal = [UIImage imageNamed:@"icon_against.png"];
        UIImage *highlight = [UIImage imageNamed:@"icon_against_active.png"];
        frame.size = normal.size;
        _downButton.frame = frame;
        [_downButton setImage:normal forState:UIControlStateNormal];
        [_downButton setImage:highlight forState:UIControlStateHighlighted];
        [self.contentView addSubview:_downButton];
    }
    return _downButton;
}

- (UIButton *)commentButton {
    if (!_commentButton) {
        self.commentButton = [UIButton buttonWithType:UIButtonTypeCustom];
        CGRect frame = CGRectMake(143, 0, 0, 0);
        UIImage *normal = [UIImage imageNamed:@"button_comment.png"];
        frame.size = normal.size;
        _commentButton.frame = frame;
        [_commentButton setImage:normal forState:UIControlStateNormal];
        [self.contentView addSubview:_commentButton];
    }
    return _commentButton;
}

- (UIButton *)shareButton {
    if (!_shareButton) {
        self.shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
        CGRect frame = CGRectZero;
        UIImage *normal = [UIImage imageNamed:@"icon_fav.png"];
        frame.origin.x = kScreenBounds.size.width - normal.size.width;
        frame.size = normal.size;
        _shareButton.frame = frame;
        [_shareButton setImage:normal forState:UIControlStateNormal];
        [self.contentView addSubview:_shareButton];
    }
    return _shareButton;
}

- (UIImageView *)userAvatar {
    if (!_userAvatar) {
        self.userAvatar = [[[UIImageView alloc] initWithFrame:(CGRect){15, 15, 40, 40}] autorelease];
        _userAvatar.layer.cornerRadius = 20;
        _userAvatar.layer.masksToBounds = YES;
        [self.contentView addSubview:_userAvatar];
    }
    return _userAvatar;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        self.nameLabel = [[[UILabel alloc] initWithFrame:(CGRect){65, 25, 200, 20}] autorelease];
        _nameLabel.textAlignment = NSTextAlignmentLeft;
        _nameLabel.font = [UIFont systemFontOfSize:14];
        _nameLabel.textColor = [UIColor orangeColor];
        [self.contentView addSubview:_nameLabel];
    }
    return _nameLabel;
}


- (UILabel *)contentLabel {
    if (!_contentLabel) {
        self.contentLabel = [[[UILabel alloc] initWithFrame:(CGRect){15, 70, kScreenBounds.size.width - 30, 0}] autorelease];
        _contentLabel.numberOfLines = 0;
        _contentLabel.font = [UIFont systemFontOfSize:15];
        _contentLabel.textColor = [UIColor grayColor];
        [self.contentView addSubview:_contentLabel];
    }
    return _contentLabel;
}

- (UILabel *)commentCountLabel {
    if (!_commentCountLabel) {
        self.commentCountLabel = [[[UILabel alloc] initWithFrame:(CGRect){15, 0, 200, 20}] autorelease];
        _commentCountLabel.font = [UIFont systemFontOfSize:12];
        _commentCountLabel.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_commentCountLabel];
    }
    return _commentCountLabel;
}

- (void)configureCellWithModel:(QiushiItem *)model {
    if (model.user) {
        [self.userAvatar sd_setImageWithURL:model.user.avatarURL placeholderImage:[UIImage imageNamed:@"default_avatar.png"]];
        self.nameLabel.text = model.user.login;
        self.nameLabel.textColor = [UIColor orangeColor];
    } else {
        self.userAvatar.image = [UIImage imageNamed:@"user_icon_anonymous.png"];
        self.nameLabel.text = @"匿名用户";
        self.nameLabel.textColor = [UIColor grayColor];
    }

    self.contentLabel.text = model.content;
    self.commentCountLabel.text = [NSString stringWithFormat:@"%@ • 评论:%ld", model.created_at, model.comments_count];
    [self setNeedsLayout];//准备布局
}
//布局子视图的方法
- (void)layoutSubviews {
    CGRect contentFrame = self.contentLabel.frame;
    contentFrame.size.height = [self contentHeight];
    self.contentLabel.frame = contentFrame;
    
    CGRect commentFrame = self.commentCountLabel.frame;
    commentFrame.origin.y = contentFrame.origin.y +contentFrame.size.height + 15;
    self.commentCountLabel.frame = commentFrame;
    
    CGRect upFrame = self.upButton.frame;
    upFrame.origin.y = commentFrame.origin.y + 20;
    self.upButton.frame = upFrame;
    
    CGRect downFrame = self.downButton.frame;
    downFrame.origin.y = commentFrame.origin.y + 20;
    self.downButton.frame = downFrame;
    
    CGRect comFrame = self.commentButton.frame;
    comFrame.origin.y = commentFrame.origin.y + 20;
    self.commentButton.frame = comFrame;
    
    CGRect shareFrame = self.shareButton.frame;
    shareFrame.origin.y = commentFrame.origin.y + 20;
    self.shareButton.frame= shareFrame;
    
    [super layoutSubviews];
}

+ (CGFloat)cellHeightWithModel:(QiushiItem *)model {
    CGFloat height = [model.content boundingRectWithSize:CGSizeMake(kScreenBounds.size.width - 30, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:15]} context:nil].size.height;

    return height + 80 + 50 + 35;
}

- (CGFloat)contentHeight {
    CGFloat height = [self.contentLabel.text boundingRectWithSize:CGSizeMake(self.contentLabel.frame.size.width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : self.contentLabel.font} context:nil].size.height;
    return height;
}


@end

//
//  LoadingView.m
//  Qiushibaike
//
//  Created by DukeMou on 15/1/16.
//  Copyright (c) 2015年 河南蓝鸥科技有限公司. All rights reserved.
//

#import "LoadingView.h"

@interface LoadingView ()

- (void)_setup;

@end

@implementation LoadingView

- (void)_setup {
    NSMutableArray *images = [NSMutableArray array];
    for (int i = 0; i < 20; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.png", i]];
        [images addObject:image];
    }
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self _setup];
    }
    return self;
}

- (instancetype)initWithImage:(UIImage *)image {
    self = [super initWithImage:image];
    if (self) {
        [self _setup];
    }
    return self;
}

- (instancetype)initWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage {
    self = [super initWithImage:image highlightedImage:highlightedImage];
    if (self) {
        [self _setup];
    }
    return self;
}

- (void)startLoading {
    self.animationDuration = 0.5;
//    self.animationRepeatCount = 10000;
    [self startAnimating];
}

- (void)stopLoading {
    [self stopAnimating];
}



@end

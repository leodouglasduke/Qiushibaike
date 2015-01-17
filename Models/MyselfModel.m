//
//  MyselfModel.m
//  Qiushibaike
//
//  Created by DukeMou on 15/1/17.
//  Copyright (c) 2015年 河南蓝鸥科技有限公司. All rights reserved.
//

#import "MyselfModel.h"

@implementation MyselfModel

- (void)dealloc {
    [_image release];
    [_title release];
    [super dealloc];
}

@end

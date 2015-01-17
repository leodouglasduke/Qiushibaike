//
//  FindModel.m
//  Qiushibaike
//
//  Created by DukeMou on 15/1/17.
//  Copyright (c) 2015年 河南蓝鸥科技有限公司. All rights reserved.
//

#import "FindModel.h"

@implementation FindModel

- (void)dealloc {
    [_image release];
    [_title release];
    [_subtitle release];
    [super dealloc];
}

@end

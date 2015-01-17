//
//  BaseModel.m
//  Qiushibaike
//
//  Created by DukeMou on 15/1/15.
//  Copyright (c) 2015年 河南蓝鸥科技有限公司. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

- (id)initWithDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {

    }
    return self;
}

+ (id)modelWithDictioanry:(NSDictionary *)dictionary {
    return [[[[self class] alloc] initWithDictionary:dictionary] autorelease];
}

@end

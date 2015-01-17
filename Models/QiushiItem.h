//
//  QiushiItem.h
//  Qiushibaike
//
//  Created by DukeMou on 15/1/15.
//  Copyright (c) 2015年 河南蓝鸥科技有限公司. All rights reserved.
//

#import "BaseModel.h"
#import "User.h"

@interface QiushiItem : BaseModel

@property (nonatomic, retain) User *user;
@property (nonatomic, retain) NSString *created_at;
@property (nonatomic, retain) NSString *content;
@property (nonatomic, assign) NSInteger comments_count;


@end

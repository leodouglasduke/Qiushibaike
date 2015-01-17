//
//  User.h
//  Qiushibaike
//
//  Created by DukeMou on 15/1/15.
//  Copyright (c) 2015年 河南蓝鸥科技有限公司. All rights reserved.
//

#import "BaseModel.h"

@interface User : BaseModel

@property (nonatomic, retain) NSString *login;
@property (nonatomic, retain) NSString *identifier;
@property (nonatomic, retain) NSString *icon;
@property (nonatomic, retain) NSURL *avatarURL;

@end

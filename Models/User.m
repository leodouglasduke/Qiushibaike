//
//  User.m
//  Qiushibaike
//
//  Created by DukeMou on 15/1/15.
//  Copyright (c) 2015年 河南蓝鸥科技有限公司. All rights reserved.
//

#import "User.h"

@implementation User

- (void)dealloc {
    [_avatarURL release];
    [_login release];
    [_identifier release];
    [_icon release];
    [super dealloc];
}

- (id)initWithDictionary:(NSDictionary *)dictionary {
    if ([dictionary isEqual:[NSNull null]]) {
        return nil;
    }
    
    if (self = [super initWithDictionary:dictionary]) {
        self.login = dictionary[@"login"];
        self.identifier = dictionary[@"id"];
        self.icon = dictionary[@"icon"];
        self.avatarURL = [self _avatarURLWithID:self.identifier icon:self.icon];
    }
    return self;
}

#define kAvatarURLFormat @"http://pic.qiushibaike.com/system/avtnew/%@/%@/medium/%@"

- (NSURL *)_avatarURLWithID:(NSString *)identifier
                       icon:(NSString *)icon {
    NSString *prefixString = [identifier substringToIndex:4];
    NSString *avatarString = [NSString stringWithFormat:kAvatarURLFormat, prefixString, identifier, icon];
    return [NSURL URLWithString:avatarString];
}



@end

//
//  QiushiItem.m
//  Qiushibaike
//
//  Created by DukeMou on 15/1/15.
//  Copyright (c) 2015年 河南蓝鸥科技有限公司. All rights reserved.
//

#import "QiushiItem.h"

@implementation QiushiItem

- (void)dealloc {
    [_user release];
    [_created_at release];
    [_content release];
    [super dealloc];
}

- (id)initWithDictionary:(NSDictionary *)dictionary {
    if (self = [super initWithDictionary:dictionary]) {
        self.user = [User modelWithDictioanry:dictionary[@"user"]];
        NSInteger timestamp = [dictionary[@"created_at"] integerValue];
        self.created_at = [self _createdDateFromTimeStamp:timestamp];
        self.content = dictionary[@"content"];
        self.comments_count = [dictionary[@"comments_count"] integerValue];
    }
    return self;
}

- (NSString *)_createdDateFromTimeStamp:(NSInteger)timestamp {
    timestamp -= 8 * 3600;
    NSDate *createdDate = [NSDate dateWithTimeIntervalSince1970:timestamp];
    NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
    NSLog(@"%@", createdDate);
    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/Shanghai"]];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *string = [formatter stringFromDate:createdDate];
    return string;
}




@end

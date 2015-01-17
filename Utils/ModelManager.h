//
//  ModelManager.h
//  Qiushibaike
//
//  Created by DukeMou on 15/1/15.
//  Copyright (c) 2015年 河南蓝鸥科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QiushiItem.h"
#import "NetworkManager.h"

#define kModelsDidFinishPackingNotification @"kModelsDidFinishPackingNotification"
#define kModelsDidStartPackingNotification @"kModelsDidStartPackingNotification"

typedef enum {
    ModelPackageTypeRefresh,//刷新数据
    ModelPackageTypeLoadingMore//加载更多
}ModelPackageType;

@interface ModelManager : NSObject<NetworkManagerDelegate>

+ (id)manager;
- (NSInteger)numberOfItems;//获取到的糗事的数量
- (QiushiItem *)itemForRowAtIndexPath:(NSIndexPath *)indexPath;//每一行单元格对应的糗事对象
- (void)packageModelWithType:(ModelPackageType)type;


@end

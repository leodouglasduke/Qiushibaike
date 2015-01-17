//
//  ModelManager.m
//  Qiushibaike
//
//  Created by DukeMou on 15/1/15.
//  Copyright (c) 2015年 河南蓝鸥科技有限公司. All rights reserved.
//

#import "ModelManager.h"
#import <UIKit/UIKit.h>

@interface ModelManager ()

@property (nonatomic, retain) NSMutableArray *datasource;//模型对象保存在此数组中
@property (nonatomic, assign) NSInteger pageNumber;//下载的页码
@property (nonatomic, assign) ModelPackageType modelPackageType;
- (void)_reset;//重置pageNumber，清空数组

@end

@implementation ModelManager

- (void)dealloc {
    [_datasource release];
    [super dealloc];
}

- (NSMutableArray *)datasource {
    if (!_datasource) {
        self.datasource = [NSMutableArray array];
    }
    return _datasource;
}

- (instancetype)init {
    if (self = [super init]) {
        [self _reset];
    }
    return self;
}

- (void)_reset {
    self.pageNumber = 1;
    [self.datasource removeAllObjects];
}

+ (id)manager {
    static ModelManager *manager = nil;
    if (manager == nil) {
        manager = [[ModelManager alloc] init];
    }
    return manager;
}

- (NSInteger)numberOfItems {
    return self.datasource.count;
}

- (QiushiItem *)itemForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.datasource[indexPath.row];
}

#define kQiushibaikeAPI @"http://m2.qiushibaike.com/article/list/text?count=30&page=%ld"
- (void)packageModelWithType:(ModelPackageType)type {
    self.modelPackageType = type;
    if (type == ModelPackageTypeRefresh) {
//        [self _reset];
        self.pageNumber = 1;
    } else {
        self.pageNumber++;
    }
    
    NSString *URLString = [NSString stringWithFormat:kQiushibaikeAPI, self.pageNumber];
    NetworkManager *network = [NetworkManager managerWithDelegate:self];
    network.HTTPType = @"GET";
    network.URLString = URLString;
    [network startAcquire];
}

- (void)managerDidStartLoading {
    [[NSNotificationCenter defaultCenter] postNotificationName:kModelsDidStartPackingNotification object:nil];
}

- (void)manager:(NetworkManager *)manager didFailedWithError:(NSError *)error {
    NSLog(@"%@", error.userInfo);
}

- (void)manager:(NetworkManager *)manager didFinishLoadingWithInfo:(id)info {
    
    if (self.modelPackageType == ModelPackageTypeRefresh) {
        [self _reset];
    }
    
    NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:info options:NSJSONReadingMutableContainers error:nil];
    NSArray *items = jsonDic[@"items"];
    for (NSDictionary *dictionary in items) {
        QiushiItem *item = [QiushiItem modelWithDictioanry:dictionary];
        [self.datasource addObject:item];
    }
    //用通知中心通知视图控制器，数据已经打包完成，可以使用
    [[NSNotificationCenter defaultCenter] postNotificationName:kModelsDidFinishPackingNotification object:nil];
}



@end

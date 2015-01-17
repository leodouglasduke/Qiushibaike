//
//  QiushiItemCell.h
//  Qiushibaike
//
//  Created by DukeMou on 15/1/15.
//  Copyright (c) 2015年 河南蓝鸥科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QiushiItem.h"
@interface QiushiItemCell : UITableViewCell

- (void)configureCellWithModel:(QiushiItem *)model;

+ (CGFloat)cellHeightWithModel:(QiushiItem *)model;


@end

//
//  YSMineCell.h
//  YSKitDemo
//
//  Created by jiangys on 16/6/21.
//  Copyright © 2016年 Jiangys. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YSMineCellItem;

@interface YSMineCell : UITableViewCell

/** cell对应的item数据 */
@property (nonatomic, strong) YSMineCellItem *item;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end

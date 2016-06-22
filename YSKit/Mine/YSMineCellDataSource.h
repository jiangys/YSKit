//
//  YSMineCellDataSource.h
//  YSKitDemo
//
//  Created by jiangys on 16/6/22.
//  Copyright © 2016年 Jiangys. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YSMineCellDataSource : NSObject<UITableViewDataSource,UITableViewDelegate>
/** 数据源 */
@property(nonatomic, strong) NSMutableArray *groupArray;

/** 初始化 数据源 */
+ (instancetype)itemWithGroupArray:(NSMutableArray *)groupArray;
@end

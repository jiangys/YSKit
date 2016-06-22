//
//  YSMineCellGroup.h
//  YSKitDemo
//
//  Created by jiangys on 16/6/21.
//  Copyright © 2016年 Jiangys. All rights reserved.
//  组模型，记录每组的组头，组尾

#import <Foundation/Foundation.h>

@interface YSMineCellGroup : NSObject

/** 组头 */
@property (nonatomic, copy) NSString *header;
/** 组尾 */
@property (nonatomic, copy) NSString *footer;
/** 这组的所有行模型(数组中存放的都是CommonCellItem模型) */
@property (nonatomic, strong) NSArray *items;

+ (instancetype)group;

@end

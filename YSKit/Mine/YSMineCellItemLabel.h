//
//  YSMineCellItemLabel.h
//  YSKitDemo
//
//  Created by jiangys on 16/6/21.
//  Copyright © 2016年 Jiangys. All rights reserved.
//  表示右边显示的是文字，继承自YSMineCellItem

#import <Foundation/Foundation.h>
#import "YSMineCellItem.h"

@interface YSMineCellItemLabel : YSMineCellItem

/** 右边label显示的内容 */
@property(nonatomic, copy) NSString *text;

@end

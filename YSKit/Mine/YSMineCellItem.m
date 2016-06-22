//
//  YSMineCellItem.m
//  YSKitDemo
//
//  Created by jiangys on 16/6/21.
//  Copyright © 2016年 Jiangys. All rights reserved.
//

#import "YSMineCellItem.h"

@implementation YSMineCellItem

+ (instancetype)itemWithTitle:(NSString *)title icon:(NSString *)icon
{
    YSMineCellItem *item = [[self alloc] init];
    item.title = title;
    item.icon = icon;
    return item;
}

+ (instancetype)itemWithTitle:(NSString *)title
{
    return [self itemWithTitle:title icon:nil];
}

@end

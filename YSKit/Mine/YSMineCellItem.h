//
//  YSMineCellItem.h
//  YSKitDemo
//
//  Created by jiangys on 16/6/21.
//  Copyright © 2016年 Jiangys. All rights reserved.
//  用一个CommonCellItem模型来描述每行的信息：图标、标题、子标题、右边的样式（箭头、文字、数字、开关、打钩）
//  右边显示文字，使用CommonCellLabelItem ，继承于CommonCellItem
//  右边显示箭头，使用CommonCellArrowItem ，继承于CommonCellItem
//  右边显示开关等，请新建一个子模型，继承于CommonCellItem

#import <Foundation/Foundation.h>

@interface YSMineCellItem : NSObject

/** 图标 */
@property (nonatomic, copy) NSString *icon;
/** 标题 */
@property (nonatomic, copy) NSString *title;
/** 子标题 */
@property (nonatomic, copy) NSString *subtitle;
/** 右边显示的数字标记 */
@property (nonatomic, copy) NSString *badgeValue;
/** 检查登录状态 Yes为检查，不符合跳转到登录页面*/
@property (nonatomic) BOOL checkLogin;
/** 点击这行cell，需要调转到哪个控制器 */
@property (nonatomic, assign) Class destVcClass;
/** 封装点击这行cell想做的事情 */
@property (nonatomic, copy) void (^operation)();

+ (instancetype)itemWithTitle:(NSString *)title icon:(NSString *)icon;
+ (instancetype)itemWithTitle:(NSString *)title;

@end

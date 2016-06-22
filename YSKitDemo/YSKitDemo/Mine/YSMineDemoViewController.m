//
//  YSMineDemoViewController.m
//  YSKitDemo
//
//  Created by jiangys on 16/6/22.
//  Copyright © 2016年 Jiangys. All rights reserved.
//

#import "YSMineDemoViewController.h"
#import "YSMine.h"
#import "YSMineSettingViewController.h"

@implementation YSMineDemoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupGroups];
}

/**
 *  初始化模型数据
 */
- (void)setupGroups
{
    [self setupGroup0];
    [self setupGroup1];
    [self setupGroup2];
}

- (void)setupGroup0
{
    // 1.创建组
    YSMineCellGroup *group = [YSMineCellGroup group];
    group.header = @"这是第一组头部";
    group.footer = @"这是第一组底部";
    [self.groups addObject:group];
    
    // 2.设置组的所有行数据
    YSMineCellItemArrow *accountManage = [YSMineCellItemArrow itemWithTitle:@"帐号管理"]; // 右边显示的是箭头
    accountManage.destVcClass = [YSMineSettingViewController class]; // 设置点击该Cell要跳转的页面
    accountManage.operation = ^(){  // 需要执行的Block
        // 需要执行的代码
    };
    
    YSMineCellItemSwitch *notifition = [YSMineCellItemSwitch itemWithTitle:@"显示通知"]; // 右边显示的是开头
    
    YSMineCellItemLabel *contactUs = [YSMineCellItemLabel itemWithTitle:@"联系我们"]; // 右边显示的是文本
    contactUs.text = @"QQ:123456"; // 设置右边显示的文件
    
    group.items = @[accountManage,notifition,contactUs];
}

- (void)setupGroup1
{
    // 1.创建组
    YSMineCellGroup *group = [YSMineCellGroup group];
    group.header = @"这是第二组";
    [self.groups addObject:group];
    
    // 2.设置组的所有行数据
    YSMineCellItemArrow *theme = [YSMineCellItemArrow itemWithTitle:@"主题、背景"];
    theme.destVcClass = [YSMineSettingViewController class];
    
    YSMineCellItemArrow *notification = [YSMineCellItemArrow itemWithTitle:@"通知"];
    notification.destVcClass = [YSMineSettingViewController class];
    
    group.items = @[theme,notification];
}

- (void)setupGroup2
{
    // 1.创建组
    YSMineCellGroup *group = [YSMineCellGroup group];
    group.header = @"头部";
    [self.groups addObject:group];
    
    // 2.设置组的所有行数据
    YSMineCellItemArrow *generalSetting = [YSMineCellItemArrow itemWithTitle:@"通用设置"];
    generalSetting.destVcClass = [YSMineSettingViewController class];
    
    group.items = @[generalSetting];
}

@end

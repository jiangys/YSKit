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
    YSMineCellItemArrow *newFriend = [YSMineCellItemArrow itemWithTitle:@"帐号管理"];
    newFriend.destVcClass = [YSMineSettingViewController class];
    
    YSMineCellItemArrow *securityAccount = [YSMineCellItemArrow itemWithTitle:@"帐号安全"];
    securityAccount.destVcClass = [YSMineSettingViewController class];
    
    group.items = @[newFriend,securityAccount];
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

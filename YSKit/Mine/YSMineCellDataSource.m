//
//  YSMineCellDataSource.m
//  YSKitDemo
//
//  Created by jiangys on 16/6/22.
//  Copyright © 2016年 Jiangys. All rights reserved.
//

#import "YSMine.h"

@implementation YSMineCellDataSource

+ (instancetype)itemWithGroupArray:(NSMutableArray *)groupArray
{
    YSMineCellDataSource *dataSource = [[self alloc] init];
    dataSource.groupArray = groupArray;
    return dataSource;
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.groupArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    YSMineCellGroup *group = self.groupArray[section];
    return group.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YSMineCell *cell = [YSMineCell cellWithTableView:tableView];
    YSMineCellGroup *group = self.groupArray[indexPath.section];
    cell.item = group.items[indexPath.row];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    YSMineCellGroup *group = self.groupArray[section];
    return group.footer;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    YSMineCellGroup *group = self.groupArray[section];
    return group.header;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 取消选中颜色
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // 取出这行对应的item模型
    YSMineCellGroup *group = self.groupArray[indexPath.section];
    YSMineCellItem *item = group.items[indexPath.row];
    
    // 检查需要登录用户才能访问
    //    if(item.checkLogin && ![UtilityTool isLogin])
    //    {
    //        UITabBarController *tabBarControler = (id)UIApplication.sharedApplication.delegate.window.rootViewController;
    //        UINavigationController *navigationController = tabBarControler.selectedViewController;
    //        LoginViewController *loginView = [[LoginViewController alloc] init];
    //        [navigationController pushViewController:loginView animated:YES];
    //        return;
    //    }
    
    // 判断有无需要跳转的控制器
    if (item.destVcClass)
    {
        UIViewController *destVc = [[item.destVcClass alloc] init];
        destVc.title = item.title;
        UIViewController *rootViewController = (id)UIApplication.sharedApplication.delegate.window.rootViewController;
        if ([rootViewController isKindOfClass:[UINavigationController class]]) {
            // 假设 App 结构是 Root -> Navigation -> ViewController
            UINavigationController *navigationController = (UINavigationController *)rootViewController;
            [navigationController pushViewController:destVc animated:YES];
        } else {
            // 假设 App 结构是 Root -> TabBar -> Navigation -> ViewController
            UITabBarController *tabBarControler = (UITabBarController *)rootViewController;
            UINavigationController *navigationController = tabBarControler.selectedViewController;
            [navigationController pushViewController:destVc animated:YES];
        }
    }
    
    // 判断有无想执行的操作
    if (item.operation)
    {
        item.operation();
    }
}

@end

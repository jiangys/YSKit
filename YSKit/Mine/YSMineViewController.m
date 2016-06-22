//
//  YSMineViewController.m
//  YSKitDemo
//
//  Created by jiangys on 16/6/22.
//  Copyright © 2016年 Jiangys. All rights reserved.
//

#import "YSMineViewController.h"
#import "YSMine.h"

@interface YSMineViewController()

@property (nonatomic, strong) NSMutableArray *groups;
@property(nonatomic, strong) YSMineCellDataSource *mineCellDataSource;

@end

@implementation YSMineViewController

- (NSMutableArray *)groups
{
    if (_groups == nil) {
        self.groups = [NSMutableArray array];
    }
    return _groups;
}

- (YSMineCellDataSource *)mineCellDataSource
{
    if (!_mineCellDataSource) {
        _mineCellDataSource = [YSMineCellDataSource itemWithGroupArray:self.groups];
    }
    return _mineCellDataSource;
}

/** 屏蔽tableView的样式 */
- (id)init
{
    return [self initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 设置tableView属性
    self.tableView.backgroundColor = YSMineTableBg;
    //self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.sectionFooterHeight = YSMineTableGroupMargin;
    self.tableView.sectionHeaderHeight = 0;
    self.tableView.contentInset = UIEdgeInsetsMake(YSMineTableGroupMargin - 35, 0, 0, 0);
    self.tableView.delegate = self.mineCellDataSource;
    self.tableView.dataSource = self.mineCellDataSource;
}

@end

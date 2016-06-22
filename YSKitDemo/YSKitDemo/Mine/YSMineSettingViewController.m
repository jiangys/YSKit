//
//  YSMineSettingViewController.m
//  YSKitDemo
//
//  Created by jiangys on 16/6/22.
//  Copyright © 2016年 Jiangys. All rights reserved.
//

#import "YSMineSettingViewController.h"
#import "YSMine.h"
#import "YSKit.h"

@interface YSMineSettingViewController()

@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) NSMutableArray *groupArray;
@property(nonatomic, strong) YSMineCellDataSource *mineCellDataSource;
@property(nonatomic, strong) UIButton *loginOutButton;

@end

@implementation YSMineSettingViewController


- (NSMutableArray *)groupArray
{
    if (!_groupArray)
    {
        _groupArray = [NSMutableArray array];
    }
    return _groupArray;
}

- (YSMineCellDataSource *)mineCellDataSource
{
    if (!_mineCellDataSource) {
        // 设置数据
        [self setupGroup];
        _mineCellDataSource = [YSMineCellDataSource itemWithGroupArray:_groupArray];
    }
    return _mineCellDataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置";
    self.view.backgroundColor = [UIColor whiteColor];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0,YSScreenWidth,YSScreenHeight) style:UITableViewStyleGrouped];
    _tableView.delegate = self.mineCellDataSource;
    _tableView.dataSource = self.mineCellDataSource;
    _tableView.sectionFooterHeight = YSMineTableGroupMargin;
    _tableView.sectionHeaderHeight = 0;
    _tableView.contentInset = UIEdgeInsetsMake(YSMineTableGroupMargin - 35, 0, 0, 0);
    _tableView.tableFooterView = [UIView new];
    [self.view addSubview:_tableView];
    
    _loginOutButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _loginOutButton.frame = CGRectMake(0,YSScreenHeight - 70,YSScreenWidth,44);
    [_loginOutButton setTitle:@"退出登录" forState:UIControlStateNormal];
    [_loginOutButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_loginOutButton setTitleColor:[UIColor grayColor]  forState:UIControlStateHighlighted];
    _loginOutButton.layer.borderColor = [UIColor grayColor].CGColor;
    _loginOutButton.layer.borderWidth = 0.5;
    _loginOutButton.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_loginOutButton];
}

- (void)setupGroup
{
    [self setupGroup0];
    [self setupGroup1];
}

- (void)setupGroup0
{
    // 1.创建组
    YSMineCellGroup *group = [YSMineCellGroup group];
    [self.groupArray addObject:group];
    
    // 2.设置组的所有行数据
    YSMineCellItemLabel *updatePhone = [YSMineCellItemLabel itemWithTitle:@"修改手机"];
    updatePhone.text = [@"13800138000" stringByReplacingCharactersInRange:NSMakeRange(3, 4) withString:@"****"];
    
    YSMineCellItemArrow *updatePwd = [YSMineCellItemArrow itemWithTitle:@"修改密码"];
    
    group.items = @[updatePhone,updatePwd];
}

- (void)setupGroup1
{
    // 1.创建组
    YSMineCellGroup *group = [YSMineCellGroup group];
    [self.groupArray addObject:group];
    
    // 2.设置组的所有行数据
    YSMineCellItemArrow *clearCache = [YSMineCellItemArrow itemWithTitle:@"清除缓存"];
    clearCache.operation = ^(){
        // 正在清除中...
    };
    
    YSMineCellItemSwitch *aboutUs = [YSMineCellItemSwitch itemWithTitle:@"显示通知"];
    
    YSMineCellItemLabel *contactUs = [YSMineCellItemLabel itemWithTitle:@"联系我们"];
    contactUs.text = @"QQ:123456";
    
#if DEBUG
    YSMineCellItemArrow *switchEnvironment = [YSMineCellItemArrow itemWithTitle:@"切换环境"];
    switchEnvironment.operation = ^(){
        BOOL bFlag = [[[NSUserDefaults standardUserDefaults] objectForKey:@"YSMineChange"] boolValue];
        [[NSUserDefaults standardUserDefaults] setObject:bFlag? @"NO":@"YES" forKey:@"YSMineChange"];
        NSString *strInfo = bFlag? @"当前环境为正式环境":@"当前环境为测试环境";
        [[NSUserDefaults standardUserDefaults] synchronize];
    };
    group.items = @[clearCache,aboutUs,contactUs,switchEnvironment];
#else
    group.items = @[clearCache,aboutUs,contactUs];
#endif
}

@end

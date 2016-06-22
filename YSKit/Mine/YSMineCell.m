//
//  YSMineCell.m
//  YSKitDemo
//
//  Created by jiangys on 16/6/21.
//  Copyright © 2016年 Jiangys. All rights reserved.
//

#import "YSMineCell.h"
#import "YSMine.h"
#import "YSKit.h"

@interface YSMineCell()

/** 箭头 */
@property (nonatomic, strong) UIImageView *rightArrow;
/** 标签 */
@property (nonatomic, strong) UILabel *rightLabel;
/** 开关 */
@property (nonatomic, strong) UISwitch *rightSwitch;
/** 提醒数字 */
//@property (nonatomic, strong) YSBadgeView *bageView;

@end

@implementation YSMineCell

#pragma mark - 懒加载右边的view

- (UIImageView *)rightArrow
{
    if (!_rightArrow) {
        // 如果想使用自定义向右箭头，请将setItem中的self.accessoryView = self.rightArrow;
        UIImageView *arrowImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"home_seeall_arrow"]];
        self.rightArrow = arrowImageView;
    }
    return _rightArrow;
}

- (UILabel *)rightLabel
{
    if (!_rightLabel) {
        self.rightLabel = [[UILabel alloc] init];
        self.rightLabel.textColor = YSMineCell_RightLabelColor;
        self.rightLabel.font = YSMineCell_RightLabelFone;
    }
    return _rightLabel;
}

- (UISwitch *)rightSwitch
{
    if (_rightSwitch == nil) {
        self.rightSwitch = [[UISwitch alloc] init];
    }
    return _rightSwitch;
}

#pragma mark - 初始化
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"YSMineCell";
    YSMineCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[YSMineCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        // 设置标题的字体
        self.textLabel.font = YSMineCell_TextLabelFone;
        self.textLabel.textColor = YSMineCell_TextLabelColor;
        self.detailTextLabel.font = YSMineCell_DetailTextLabelFone;
        
        // 设置cell的默认背景色
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

#pragma mark - 调整子控件的位置
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 调整子标题的x
    CGRect frame = self.frame;
    frame.origin.x = CGRectGetMaxX(self.textLabel.frame) + 5;
    self.detailTextLabel.frame = frame;
}

- (void)setItem:(YSMineCellItem *)item
{
    _item = item;
    
    // 1.设置基本数据
    self.imageView.image = [UIImage imageNamed:item.icon];
    self.textLabel.text = item.title;
    self.detailTextLabel.text = item.subtitle;
    
    // 2.设置右边的内容
    if ([item isKindOfClass:[YSMineCellItemArrow class]]) {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        //self.accessoryView = self.rightArrow;
    } else if ([item isKindOfClass:[YSMineCellItemLabel class]]) {
        YSMineCellItemLabel *itemLabel = (YSMineCellItemLabel *)item;
        // 设置文字
        self.rightLabel.text = itemLabel.text;
        // 根据文字计算尺寸
        self.rightLabel.size = [itemLabel.text sizeMakeWithFont:self.rightLabel.font];
        self.accessoryView = self.rightLabel;
    } else { // 取消右边的内容
        self.accessoryView = nil;
    }
}

@end

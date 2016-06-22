//
//  YSMine.h
//  YSKitDemo
//
//  Created by jiangys on 16/6/21.
//  Copyright © 2016年 Jiangys. All rights reserved.
//

#import "YSMineCellItem.h"
#import "YSMineCellGroup.h"
#import "YSMineCellItemLabel.h"
#import "YSMineCellItemArrow.h"
#import "YSMineCellItemSwitch.h"
#import "YSMineCell.h"
#import "YSMineCellDataSource.h"


#define YSMineColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

/** 背景色 */
#define YSMineTableBg YSMineColor(239, 239, 244)
/** 每组距离上一组的高度 */
#define YSMineTableGroupMargin 15

/** 左边标题字体大小 */
#define YSMineCell_TextLabelFone [UIFont systemFontOfSize:15]
/** 左边标题字体颜色 */
#define YSMineCell_TextLabelColor [UIColor blackColor]
/** 左边描述大小 */
#define YSMineCell_DetailTextLabelFone [UIFont systemFontOfSize:13]
/** 右边文字颜色 */
#define YSMineCell_RightLabelColor [UIColor lightGrayColor]
/** 右边文字大小 */
#define YSMineCell_RightLabelFone [UIFont systemFontOfSize:13]

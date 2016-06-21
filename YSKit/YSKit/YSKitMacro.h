//
//  YSKitMacro.h
//  YSKitDemo
//
//  Created by jiangys on 16/6/20.
//  Copyright © 2016年 Jiangys. All rights reserved.
//

#ifndef YSKitMacro_h
#define YSKitMacro_h

/** 字体*/
#define YSFont(x) [UIFont systemFontOfSize:x]
#define YSBoldFont(x) [UIFont boldSystemFontOfSize:x]

/** 颜色*/
#define YSRGBColor(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define YSRGBAColor(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define YSRGB16Color(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

/** 输出*/
#if DEBUG
#define YSLog(fmt,...) NSLog((@"%s [Line %d] " fmt),__PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define YSLog(fmt, ...)
#endif

#define YSLog_CurrentMethod YSLog(@"%s",__FUNCTION__);
#define YSLog_CurrentLine YSLog(@"%d",__LINE__);
#define YSLog_CurrentClass YSLog(@"%s",__FILE__);
#define YSLog_CurrentStack YSLog(@"%@",[NSThread callStackSymbols]);
#define YSLog_CurrentPath YSLog(@"%s",__FILE__);
#define YSLog_CurrentDetail YSLog(@"class==>%@, method==>%s, line==>%d",[self class],__FUNCTION__,__LINE__);

/** 获取硬件信息*/
#define YSScreenWidth [UIScreen mainScreen].bounds.size.width
#define YSScreenHeight [UIScreen mainScreen].bounds.size.height
#define YSTabbar_H 64
#define YSCurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])
#define YSCurrentSystemVersion [[[UIDevice currentDevice] systemVersion] floatValue]

/** 适配*/
#define YSiOS_5_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 5.0)
#define YSiOS_6_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0)
#define YSiOS_7_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define YSiOS_8_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
#define YSiOS_9_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0)

#define YSiPhone4_OR_4s    (YSSCREEN_H == 480)
#define YSiPhone5_OR_5c_OR_5s   (YSSCREEN_H == 568)
#define YSiPhone6_OR_6s   (YSSCREEN_H == 667)
#define YSiPhone6Plus_OR_6sPlus   (YSSCREEN_H == 736)

/** 弱指针*/
/**
 Synthsize a weak or strong reference.
 
 Example:
    @weakify(self)
    [self doSomething^{
        @strongify(self)
        if (!self) return;
        ...
    }];
 */
#ifndef weakify
    #if DEBUG
        #if __has_feature(objc_arc)
        #define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
        #else
        #define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
        #endif
    #else
        #if __has_feature(objc_arc)
        #define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
        #else
        #define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
        #endif
    #endif
#endif

#ifndef strongify
    #if DEBUG
        #if __has_feature(objc_arc)
        #define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
        #else
        #define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
        #endif
#else
        #if __has_feature(objc_arc)
        #define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
        #else
        #define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
        #endif
    #endif
#endif

/** 加载本地文件*/
#define YSLoadImage(file,type) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:file ofType:type]]
#define YSLoadArray(file,type) [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:file ofType:type]]
#define YSLoadDict(file,type) [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle]pathForResource:file ofType:type]]

/** 资源路径 */
#define YSPNG_PATH(NAME) [[NSBundle mainBundle] pathForResource:[NSString stringWithUTF8String:NAME] ofType:@"png"]
#define YSJPG_PATH(NAME) [[NSBundle mainBundle] pathForResource:[NSString stringWithUTF8String:NAME] ofType:@"jpg"]
#define YSPATH(NAME,EXT) [[NSBundle mainBundle] pathForResource:(NAME) ofType:(EXT)]

/** 加载图片 */
#define YSIMAGE_NAMED(NAME)       [UIImage imageNamed:NAME]
#define YSPNG_IMAGE_FILE(NAME)    [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(NAME) ofType:@"png"]]
#define YSJPG_IMAGE_FILE(NAME)    [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(NAME) ofType:@"jpg"]]
#define YSIMAGE_FILE(NAME,EXT)    [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(NAME) ofType:(EXT)]]

/** 多线程GCD*/
#define YSGlobalGCD(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define YSMainGCD(block) dispatch_async(dispatch_get_main_queue(),block)

/** 数据存储*/
#define kYSUserDefaults [NSUserDefaults standardUserDefaults]
#define kYSCacheDir [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject]
#define kYSDocumentDir [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]
#define kYSTempDir NSTemporaryDirectory()

/** 非空block，把block和参数都写好，如果block不为空才执行*/
#define YSNotNilBlock(block, ...) if (block) { block(__VA_ARGS__); };

#endif /* YSKitMacro_h */

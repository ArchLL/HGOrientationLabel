//
//  ARAlignLabel.h
//  ARUILabelTextAlign
//
//  Created by UIDesigner on 2018/4/11.
//  Copyright © 2018年 UIDesigner. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ARMaker;

typedef NS_ENUM(NSUInteger,textAlignType)
{
    textAlignType_top = 10,   // 顶部对齐
    textAlignType_left,       // 左边对齐
    textAlignType_bottom,     // 底部对齐
    textAlignType_right,      // 右边对齐
    textAlignType_center      // 水平/垂直对齐（默认中心对齐）
};

@interface ARAlignLabel : UILabel

/**
 *  根据对齐方式进行文本对齐
 *
 *  @param alignType 对齐block
 */
- (void)textAlign:(void(^)(ARMaker *make))alignType;

@end


//工具类
@interface ARMaker : NSObject

/* 存放对齐样式 */
@property(nonatomic, strong) NSMutableArray *typeArray;

/**
 *  添加对齐样式
 */
- (ARMaker *(^)(textAlignType type))addAlignType;

@end

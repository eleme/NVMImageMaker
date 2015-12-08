//
//  NVMImageMaker.h
//  eleme
//
//  Created by 顾超 on N/19/15.
//  Copyright © 2015 Rajax Network Technology Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NVMImageMaker : NSObject

/// image fill color
- (NVMImageMaker* _Nonnull (^_Nonnull)(UIColor* _Nonnull imageFillColor))fillColor;
/// image border color
- (NVMImageMaker* _Nonnull (^_Nonnull)(UIColor* _Nonnull imageBorderColor))borderColor;
/// border 的 width, 默认 1 px, 仅当设置了 border color 才有效果
- (NVMImageMaker* _Nonnull (^_Nonnull)(CGFloat imageBorderWidth))borderWidth;
/// corner radius
- (NVMImageMaker* _Nonnull (^_Nonnull)(CGFloat imageCornerRadius))cornerRadius;
/// 透明度, 范围 0 - 1, 会应用在整个 image 上
- (NVMImageMaker* _Nonnull (^_Nonnull)(CGFloat opacity))opacity;

/// 生成 image 返回
- (nonnull UIImage *)make;

- (nonnull instancetype)init NS_UNAVAILABLE;

@end

/// API 的入口, 从这里开始进行 chaining 式的 image making
extern NVMImageMaker* _Nonnull nvm_beginImage(CGSize imageSize);

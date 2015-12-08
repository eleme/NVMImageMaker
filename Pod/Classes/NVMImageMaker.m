//
//  NVMImageMaker.m
//  eleme
//
//  Created by 顾超 on N/19/15.
//  Copyright © 2015 Rajax Network Technology Co., Ltd. All rights reserved.
//

#import "NVMImageMaker.h"

@interface NVMImageMaker ()

@property (nonatomic, copy) UIColor *imageFillColor;
@property (nonatomic, copy) UIColor *imageBorderColor;
@property (nonatomic) CGSize imageSize;

@property (nonatomic) NSNumber *imageBorderWidth;
@property (nonatomic) NSNumber *imageCornerRadius;
@property (nonatomic) NSNumber *imageOpacity;

@end

@implementation NVMImageMaker

- (NVMImageMaker *_Nonnull (^_Nonnull)(UIColor *_Nonnull imageFillColor))fillColor {
  return ^NVMImageMaker *(UIColor *imageFillColor) {
    self.imageFillColor = imageFillColor;
    return self;
  };
}

- (NVMImageMaker *_Nonnull (^_Nonnull)(UIColor *_Nonnull imageBorderColor))borderColor {
  return ^NVMImageMaker *(UIColor *imageBorderColor) {
    self.imageBorderColor = imageBorderColor;
    return self;
  };
}

- (NVMImageMaker* _Nonnull (^_Nonnull)(CGFloat imageBorderWidth))borderWidth {
  return ^NVMImageMaker *(CGFloat imageBorderWidth) {
    self.imageBorderWidth = @(imageBorderWidth);
    return self;
  };
}

- (NVMImageMaker *_Nonnull (^_Nonnull)(CGFloat imageCornerRadius))cornerRadius {
  return ^NVMImageMaker *(CGFloat imageCornerRadius) {
    self.imageCornerRadius = @(imageCornerRadius);
    return self;
  };
}

- (NVMImageMaker *_Nonnull (^_Nonnull)(CGFloat opacity))opacity {
  return ^NVMImageMaker *(CGFloat opacity) {
    self.imageOpacity = @(MAX(MIN(opacity, 1), 0));
    return self;
  };
}

- (UIImage *)make {
  UIGraphicsBeginImageContextWithOptions(self.imageSize, NO, 0);
  CGContextRef context = UIGraphicsGetCurrentContext();
  // image bounds
  CGRect bounds = CGRectMake(0, 0, self.imageSize.width, self.imageSize.height);
  // path for image
  UIBezierPath *boundingPath = nil;
  UIBezierPath *drawingPath = nil;
  if (self.imageCornerRadius) {
    boundingPath = [UIBezierPath bezierPathWithRoundedRect:bounds cornerRadius:self.imageCornerRadius.floatValue];
    drawingPath = [UIBezierPath bezierPathWithRoundedRect:CGRectInset(bounds, self.imageBorderWidth.floatValue / 2,
                                                                      self.imageBorderWidth.floatValue / 2)
                                             cornerRadius:self.imageCornerRadius.floatValue];
    [drawingPath setLineWidth:self.imageBorderWidth.floatValue];
  } else {
    boundingPath = [UIBezierPath bezierPathWithRect:bounds];
    drawingPath = [UIBezierPath bezierPathWithRect:CGRectInset(bounds, self.imageBorderWidth.floatValue / 2,
                                                               self.imageBorderWidth.floatValue / 2)];
    [drawingPath setLineWidth:self.imageBorderWidth.floatValue];
  }
  [boundingPath addClip];
  
  // opacity
  if (self.imageOpacity) {
    self.imageFillColor = [self.imageFillColor colorWithAlphaComponent:self.imageOpacity.floatValue];
    self.imageBorderColor = [self.imageBorderColor colorWithAlphaComponent:self.imageOpacity.floatValue];
  }
  // fill && stroke
  if (self.imageFillColor) {
    CGContextSetFillColorWithColor(context, self.imageFillColor.CGColor);
    if (self.imageBorderColor) {
      // fill the drawing path instead if there will be border, to avoid drawing outside of the path if there is corner radius
      [drawingPath fill];
    } else {
      // fill the boundingPath if there will be no border
      [boundingPath fill];
    }
  }
  if (self.imageBorderColor) {
    CGContextSetStrokeColorWithColor(context, self.imageBorderColor.CGColor);
    [drawingPath stroke];
  }

  UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return image;
}

#pragma mark - Accessors

- (NSNumber *)imageBorderWidth {
  if (!_imageBorderWidth) {
    _imageBorderWidth = @(1 / [UIScreen mainScreen].scale);
  }
  return _imageBorderWidth;
}

@end

extern NVMImageMaker *_Nonnull nvm_beginImage(CGSize imageSize) {
  NVMImageMaker *maker = [NVMImageMaker new];
  maker.imageSize = imageSize;
  return maker;
}

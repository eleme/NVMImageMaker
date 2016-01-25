//
//  NVMImageMakerTests.m
//  NVMImageMakerTests
//
//  Created by axl411 on 12/08/2015.
//  Copyright (c) 2015 axl411. All rights reserved.
//

#import <NVMImageMaker/NVMImageMaker.h>
#import <FBSnapshotTestCase/FBSnapshotTestCase.h>

@import XCTest;

@interface Tests : FBSnapshotTestCase

@end

@implementation Tests

- (void)setUp {
  [super setUp];
  self.recordMode = NO;
}

- (void)testImage {
  CGSize size = CGSizeMake(200, 300);
  UIColor *fillColor = [UIColor yellowColor];
  UIColor *borderColor = [UIColor blackColor];
  UIImage *image = nvm_beginImage(size).fillColor(fillColor).borderColor(borderColor).cornerRadius(20.).opacity(0.5).make;
  UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
  self.usesDrawViewHierarchyInRect = YES;
  FBSnapshotVerifyView(imageView, nil);
}

@end


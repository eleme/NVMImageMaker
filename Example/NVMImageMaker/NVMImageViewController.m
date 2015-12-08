//
//  NVMImageViewController.m
//  NVMImageMaker
//
//  Created by 顾超 on Dec/2/15.
//  Copyright © 2015 Chao Gu. All rights reserved.
//

#import "NVMImageViewController.h"

@interface NVMImageViewController ()

@property (nonatomic) UIImageView *imageView;

@end

@implementation NVMImageViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  [self.view addSubview:self.imageView];
  self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
  NSDictionary *viewsDict = @{ @"imageView" : self.imageView };
  [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[imageView]|"
                                                                    options:kNilOptions
                                                                    metrics:nil
                                                                      views:viewsDict]];
  [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[imageView]|"
                                                                    options:kNilOptions
                                                                    metrics:nil
                                                                      views:viewsDict]];
}

- (UIImageView *)imageView {
  if (!_imageView) {
    _imageView = [UIImageView new];
    _imageView.backgroundColor = [UIColor whiteColor];
    _imageView.contentMode = UIViewContentModeCenter;
  }
  return _imageView;
}

@end

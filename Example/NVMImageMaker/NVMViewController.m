//
//  NVMViewController.m
//  NVMImageMaker
//
//  Created by axl411 on 12/08/2015.
//  Copyright (c) 2015 axl411. All rights reserved.
//

#import "NVMViewController.h"
#import "NVMImageViewController.h"
#import <NVMImageMaker/NVMImageMaker.h>

@interface NVMViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic) UITableView *tableView;
@property (nonatomic) NSArray<NSString *> *tableData;
@property (nonatomic) NVMImageViewController *imageViewController;

@end

@implementation NVMViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  [self.view addSubview:self.tableView];
  self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
  NSDictionary *viewsDict = @{ @"tableView" : self.tableView };
  [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[tableView]|"
                                                                    options:kNilOptions
                                                                    metrics:nil
                                                                      views:viewsDict]];
  [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[tableView]|"
                                                                    options:kNilOptions
                                                                    metrics:nil
                                                                      views:viewsDict]];
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  
  [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.tableData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
  cell.textLabel.text = self.tableData[indexPath.row];
  return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  UIImage *image = nil;
  CGSize size = CGSizeMake(200, 300);
  UIColor *fillColor = [UIColor yellowColor];
  UIColor *borderColor = [UIColor blackColor];
  switch (indexPath.row) {
    case 0:
      image = nvm_beginImage(size).fillColor(fillColor).make;
      break;
      
    case 1:
      image = nvm_beginImage(size).borderColor(borderColor).borderWidth(10).make;
      break;
      
    case 2:
      image = nvm_beginImage(size).fillColor(fillColor).borderColor(borderColor).borderWidth(10).make;
      break;
      
    case 3:
      image = nvm_beginImage(size).fillColor(fillColor).borderColor(borderColor).cornerRadius(20).borderWidth(10).make;
      break;
      
    case 4:
      image = nvm_beginImage(size).fillColor(fillColor).borderColor(borderColor).cornerRadius(20).opacity(0.5).make;
      break;
      
    default:
      break;
  }
  self.imageViewController.imageView.image = image;
  [self.navigationController pushViewController:self.imageViewController animated:YES];
}

- (NSArray<NSString *> *)tableData {
  if (!_tableData) {
    _tableData = @[
                   @"fill",
                   @"border",
                   @"fill + border",
                   @"fill + border + cornerRadius",
                   @"fill + border + cornerRadius + opacity"
                   ];
  }
  return _tableData;
}

- (NVMImageViewController *)imageViewController {
  if (!_imageViewController) {
    _imageViewController = [NVMImageViewController new];
  }
  return _imageViewController;
}

- (UITableView *)tableView {
  if (!_tableView) {
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    UIEdgeInsets insets = UIEdgeInsetsMake(64, 0, 0, 0);
    _tableView.contentInset = insets;
    _tableView.scrollIndicatorInsets = insets;
  }
  return _tableView;
}

@end

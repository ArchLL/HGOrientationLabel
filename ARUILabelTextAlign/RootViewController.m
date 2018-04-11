//
//  ViewController.m
//  ARUILabelTextAlign
//
//  Created by UIDesigner on 2018/4/11.
//  Copyright © 2018年 UIDesigner. All rights reserved.
//

#import "RootViewController.h"
#import "NextViewController.h"

@interface RootViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, copy) NSArray *titleArray;

@end

@implementation RootViewController

- (NSArray *)titleArray {
    if (!_titleArray) {
        _titleArray = @[@"左上", @"左中", @"左下", @"上中", @"中心", @"下中", @"右上", @"右中", @"右下", @"富文本底部对齐"];
    }
    return _titleArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    self.view.backgroundColor = [UIColor whiteColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 50;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"tableViewCell"];
}

#pragma mark - tableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tableViewCell"];
    cell.textLabel.text = _titleArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    NextViewController *vc = [[NextViewController alloc] init];
    vc.index = indexPath.row;
    vc.title = _titleArray[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

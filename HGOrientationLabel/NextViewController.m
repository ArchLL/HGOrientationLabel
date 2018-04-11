//
//  NextViewController.m
//  HGOrientationLabel
//
//  Created by Arch on 2018/4/11.
//  Copyright © 2018年 Arch. All rights reserved.
//

#import "NextViewController.h"
#import "HGOrientationLabel.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width

@interface NextViewController ()

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    if (_index == 9) {
        //富文本底部对齐
        [self attributedTextAgainOfBottom];
    }else {
        HGOrientationLabel *label = [[HGOrientationLabel alloc] initWithFrame:CGRectMake(kScreenWidth/2.0 - 150, 300, 300, 80)];
        label.backgroundColor = [UIColor orangeColor];
        label.textColor = [UIColor blackColor];
        label.font = [UIFont systemFontOfSize:18];
        label.text = @"爱学习，爱编程，爱咖啡可乐";
        label.numberOfLines = 1;
        [self.view addSubview:label];
        
        switch (_index) {
            case 0:
                [label textAlign:^(HGMaker *make) {
                    make.addAlignType(textAlignType_left).addAlignType(textAlignType_top);
                }];
                break;
            case 1:
                [label textAlign:^(HGMaker *make) {
                    make.addAlignType(textAlignType_left).addAlignType(textAlignType_center);
                }];
                break;
            case 2:
                [label textAlign:^(HGMaker *make) {
                    make.addAlignType(textAlignType_left).addAlignType(textAlignType_bottom);
                }];
                break;
            case 3:
                [label textAlign:^(HGMaker *make) {
                    make.addAlignType(textAlignType_center).addAlignType(textAlignType_top);
                }];
                break;
            case 4:
                [label textAlign:^(HGMaker *make) {
                    make.addAlignType(textAlignType_center);
                }];
                break;
            case 5:
                [label textAlign:^(HGMaker *make) {
                    make.addAlignType(textAlignType_center).addAlignType(textAlignType_bottom);
                }];
                break;
            case 6:
                [label textAlign:^(HGMaker *make) {
                    make.addAlignType(textAlignType_right).addAlignType(textAlignType_top);
                }];
                break;
            case 7:
                [label textAlign:^(HGMaker *make) {
                    make.addAlignType(textAlignType_right).addAlignType(textAlignType_center);
                }];
                break;
            case 8:
                [label textAlign:^(HGMaker *make) {
                    make.addAlignType(textAlignType_right).addAlignType(textAlignType_bottom);
                }];
                break;
            default:
                break;
        }
    }
}

//富文本底部对齐
- (void)attributedTextAgainOfBottom {
    
    CGFloat space = 10.0;
    
    HGOrientationLabel *leftLB = [[HGOrientationLabel alloc] initWithFrame:CGRectMake(20, 200, kScreenWidth/2.0 - 20 - space/2.0, 80)];
    leftLB.backgroundColor = [UIColor lightGrayColor];
    leftLB.textColor = [UIColor blackColor];
    leftLB.numberOfLines = 1;
    [self.view addSubview:leftLB];
    //右下
    [leftLB textAlign:^(HGMaker *make) {
        make.addAlignType(textAlignType_center);
    }];
    
    NSMutableAttributedString  *attributedArr = [[NSMutableAttributedString alloc] initWithString:@"单价 $123"];
    [attributedArr setAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:40], NSForegroundColorAttributeName:[UIColor blackColor]} range:NSMakeRange(0, 1)];
    [attributedArr setAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:25], NSForegroundColorAttributeName:[UIColor blackColor]} range:NSMakeRange(1, 1)];
    [attributedArr setAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20], NSForegroundColorAttributeName:[UIColor blueColor]} range:NSMakeRange(3, 1)];
    [attributedArr setAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:35], NSForegroundColorAttributeName:[UIColor redColor]} range:NSMakeRange(4, attributedArr.length - 4)];
    
    leftLB.attributedText = attributedArr;
    
    
    //对齐之后
    HGOrientationLabel *rightLB = [[HGOrientationLabel alloc] initWithFrame:CGRectMake(kScreenWidth/2.0 + space/2.0, 200, leftLB.frame.size.width, 80)];
    rightLB.backgroundColor = [UIColor lightGrayColor];
    rightLB.textColor = [UIColor blackColor];
    rightLB.numberOfLines = 1;
    [self.view addSubview:rightLB];
    //左下
    [rightLB textAlign:^(HGMaker *make) {
        make.addAlignType(textAlignType_center);
    }];
    
    //设置部分文字的偏移量 (0是让文字保持原来的位置, 负值是让文字下移，正值是让文字上移)
    [attributedArr addAttribute:NSBaselineOffsetAttributeName value:@(1) range:NSMakeRange(0, 1)];
    [attributedArr addAttribute:NSBaselineOffsetAttributeName value:@(0) range:NSMakeRange(1, 1)];
    [attributedArr addAttribute:NSBaselineOffsetAttributeName value:@(-2) range:NSMakeRange(3, 1)];
    [attributedArr addAttribute:NSBaselineOffsetAttributeName value:@(-3) range:NSMakeRange(4, attributedArr.length - 4)];
    
    rightLB.attributedText = attributedArr;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

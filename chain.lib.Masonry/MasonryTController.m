//
//  MasonryTController.m
//  chain.lib.Masonry
//
//  Created by admin on 2018/11/11.
//  Copyright © 2018年 huoshuguang. All rights reserved.
//

#import "MasonryTController.h"
#import <Masonry/Masonry.h>
@interface MasonryTController ()

@end

@implementation MasonryTController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    UIView *redView = [UIView new];
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(@10);
        make.right.bottom.equalTo(@-10);
    }];
    /**
     函数式编程：使得所有的逻辑相关的代码放在block中一起执行
     mas_makeConstraints执行流程
     1. 创建约束制造者，MASConstraintMaker，并且绑定控件
     2. 执行mas_makeConstraints传入的Block
     3. 让约束制造者安装约束（即将Masonry设置转为NSLayout系统约束）
        1. 清空之前所有的约束
        2. 遍历约束数组，一个一个的安装，用的就是NSLayoutConstraint来安装约束
     
     */
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

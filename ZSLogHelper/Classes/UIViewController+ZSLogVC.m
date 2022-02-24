//
//  UIViewController+ZSLogVC.m
//  ZSLogHelper_Example
//
//  Created by 钓鱼之家 on 2022/2/24.
//  Copyright © 2022 elite_members@163.com. All rights reserved.
//

#import "UIViewController+ZSLogVC.h"
#import <objc/runtime.h>

@implementation UIViewController (ZSLogVC)

+ (void)load {
// 开发环境 查看哪个viewController将出现
#ifdef DEBUG
    //原本的viewWillAppear方法
    Method viewWillAppear = class_getInstanceMethod(self, @selector(viewWillAppear:));
    //需要替换成 能够输出日志的viewWillAppear
    Method logViewWillAppear = class_getInstanceMethod(self, @selector(logViewWillAppear:));
    //两方法进行交换
    method_exchangeImplementations(viewWillAppear, logViewWillAppear);
#endif
}

- (void)logViewWillAppear:(BOOL)animated {
    NSString *className = NSStringFromClass([self class]);
    NSLog(@"%@ will appear", className);
    [self logViewWillAppear:animated];
}


@end

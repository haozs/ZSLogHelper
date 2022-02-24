//
//  UITableView+ZSLogSelectedRow.m
//  ZSLogHelper
//
//  Created by 钓鱼之家 on 2022/2/24.
//

#import "UITableView+ZSLogSelectedRow.h"
#import <objc/runtime.h>

@implementation UITableView (ZSLogSelectedRow)

+ (void)load {
#ifdef DEBUG
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class cls = [self class];
        Method m1 = class_getInstanceMethod(
            cls, NSSelectorFromString(@"_selectRowAtIndexPath:animated:scrollPosition:notifyDelegate:"));
        Method m2 = class_getInstanceMethod(
            cls, NSSelectorFromString(@"selectRowAtIndexPath:animated:scrollPosition:notifyDelegate_logPath:"));
        method_exchangeImplementations(m1, m2);

    });
#endif
}

- (void)selectRowAtIndexPath:(id)arg1 animated:(BOOL)arg2 scrollPosition:(int)arg3 notifyDelegate_logPath:(BOOL)arg4 {
    NSLog(@"log_UITableView_Delegate_Path:%s\n", NSStringFromClass([self.delegate class]).UTF8String);
    [self selectRowAtIndexPath:arg1 animated:arg2 scrollPosition:arg3 notifyDelegate_logPath:arg4];
}

@end

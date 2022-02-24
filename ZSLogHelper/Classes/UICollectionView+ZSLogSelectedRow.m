//
//  UICollectionView+ZSLogSelectedRow.m
//  ZSLogHelper
//
//  Created by 钓鱼之家 on 2022/2/24.
//

#import "UICollectionView+ZSLogSelectedRow.h"
#import <objc/runtime.h>

@implementation UICollectionView (ZSLogSelectedRow)

+ (void)load {
#ifdef DEBUG
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class cls = [self class];
        Method m1 = class_getInstanceMethod(
            cls, NSSelectorFromString(@"_selectItemAtIndexPath:animated:scrollPosition:notifyDelegate:"));
        Method m2 = class_getInstanceMethod(
            cls, NSSelectorFromString(@"selectItemAtIndexPath:animated:scrollPosition:notifyDelegate_logPath:"));
        method_exchangeImplementations(m1, m2);

    });

#endif
}

- (void)selectItemAtIndexPath:(id)arg1
                     animated:(BOOL)arg2
               scrollPosition:(unsigned int)arg3
       notifyDelegate_logPath:(BOOL)arg4 {
    NSLog(@"log_UICollectionView_Delegate_Path:%s\n", NSStringFromClass([self.delegate class]).UTF8String);
    [self selectItemAtIndexPath:arg1 animated:arg2 scrollPosition:arg3 notifyDelegate_logPath:arg4];
}

@end

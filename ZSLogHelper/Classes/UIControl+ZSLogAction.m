//
//  UIControl+ZSLogAction.m
//  ZSLogHelper_Example
//
//  Created by 钓鱼之家 on 2022/2/23.
//  Copyright © 2022 elite_members@163.com. All rights reserved.
//

#import "UIControl+ZSLogAction.h"
#import <objc/runtime.h>

@implementation UIControl (ZSLogAction)

+ (void)load {
#ifdef DEBUG
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class cls = [self class];
        Method m1 = class_getInstanceMethod(cls, @selector(sendAction:to:forEvent:));
        Method m2 = class_getInstanceMethod(cls, @selector(sendAction_withLog:to:forEvent:));
        method_exchangeImplementations(m1, m2);
    });
#endif
}

- (void)sendAction_withLog:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    NSLog(@"Log_UIControl_Path:%s,Action:%s\n", NSStringFromClass([target class]).UTF8String,
          [NSStringFromSelector(action) UTF8String]);
    [self sendAction_withLog:action to:target forEvent:event];
}

@end

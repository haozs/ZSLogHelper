//
//  NSObject+ZSLogGesture.m
//  ZSLogHelper
//
//  Created by 钓鱼之家 on 2022/2/24.
//

#import "NSObject+ZSLogGesture.h"
#import <objc/runtime.h>

@implementation NSObject (ZSLogGesture)

+ (void)load {
#ifdef DEBUG
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class cls = NSClassFromString(@"UIGestureRecognizerTarget");
        Method m1 = class_getInstanceMethod(cls, NSSelectorFromString(@"_sendActionWithGestureRecognizer:"));
        Method m2 = class_getInstanceMethod([self class], NSSelectorFromString(@"sendActionWithGestureRecognizer_logGesture:"));
        method_exchangeImplementations(m1, m2);
    });
#endif
}

- (void)sendActionWithGestureRecognizer_logGesture:(id)arg1 {
    if ([arg1 isKindOfClass:[NSClassFromString(@"UITapGestureRecognizer") class]]) {
        NSLog(@"log_Gesture_Path:%@\n", arg1);
    }
    [self sendActionWithGestureRecognizer_logGesture:arg1];
}

@end

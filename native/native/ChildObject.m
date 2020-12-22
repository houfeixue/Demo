//
//  ChildObject.m
//  native
//
//  Created by heshenghui on 2020/12/16.
//  Copyright © 2020 Company. All rights reserved.
//

#import "ChildObject.h"

@implementation ChildObject

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    NSLog(@"1---%@",NSStringFromSelector(sel));
    NSLog(@"1---%@",NSStringFromSelector(_cmd));
    return NO;
}
//-(void)resolveInstanceMethod{
//    [super resolveInstanceMethod];
//    NSLog(@"resolveInstanceMethod")
//}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    NSLog(@"forwardingTargetForSelector");
    return nil;
}

@end

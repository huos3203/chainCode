//
//  Person.m
//  chain.lib.getblock
//
//  Created by admin on 2018/11/11.
//  Copyright © 2018年 huoshuguang. All rights reserved.
//

#import "Person.h"

@implementation Person

-(void)eatWithBlock:(void (^)(void))eat
{
    //执行block
    eat();
}

-(NSString *)run
{
    NSLog(@"跑步🏃‍♀️🏃🏃‍♀️🏃🏃‍♀️🏃");
    return @"我是普通get方法";
}

-(void (^)(void))walk
{
    void(^walk)(void) = ^{
        NSLog(@"普通散步行走");
    };
    return walk;
}

-(Person *(^)(NSString *))chainWalk
{
    Person *(^chainWalk)(NSString *) = ^Person *(NSString *place) {
        NSLog(@"在%@广场链式散步",place);
        return self;
    };
    return chainWalk;
}

@end

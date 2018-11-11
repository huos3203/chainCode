//
//  chain_lib_getblockTests.m
//  chain.lib.getblockTests
//
//  Created by admin on 2018/11/11.
//  Copyright © 2018年 huoshuguang. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Person.h"
@interface chain_lib_getblockTests : XCTestCase

@end

@implementation chain_lib_getblockTests
{
    Person *person;
}
- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    person = [Person new];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}
///block作为属性
- (void)testShX {
    person.eat = ^{
        NSLog(@"吃的兰州拉面");
    };
    person.eat();
}
/// block作为参数
- (void)testChS {
    ///调用方法，block为参数
    [person eatWithBlock:^{
        NSLog(@"作为参数吃拉面");
    }];
}
/// block作为返回值
- (void)testReturnValue {
    NSLog(@"%@",person.run);
    
    ///block作为返回值
    person.walk();
    
    ///block作为返回值，block返回对象本省,实现链式编程
    person.chainWalk(@"人民广场").chainWalk(@"奥林匹克公园").chainWalk(@"go home");
    
}


- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end

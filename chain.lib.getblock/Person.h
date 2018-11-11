//
//  Person.h
//  chain.lib.getblock
//
//  Created by admin on 2018/11/11.
//  Copyright © 2018年 huoshuguang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

/// block作为属性 ARC使用strong  非ARC使用copy
@property (strong, nonatomic) void(^eat)(void);
/// block作为参数
-(void)eatWithBlock:(void(^)(void))eat;
///普通的get方法，可以使用点语法执行
-(NSString *)run;
/// block作为返回值,block返回空
-(void(^)(void))walk;
///block作为返回值，block返回对象自己
-(Person *(^)(NSString *))chainWalk;

@end

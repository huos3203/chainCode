#  block的链式编程思想
### block的常用方法
通过熟悉block的常用方法,引出链式编程
1. block作为属性
```objc
/// block作为属性 ARC使用strong  非ARC使用copy
@property (strong, nonatomic) void(^eat)(void);
- (void)testShX {
    person.eat = ^{
        NSLog(@"吃的兰州拉面");
    };
    person.eat();
}
```

2. block作为参数
```objc
/// block作为参数
-(void)eatWithBlock:(void(^)(void))eat;
- (void)testChS {
    ///调用方法，block为参数
    [person eatWithBlock:^{
        NSLog(@"作为参数吃拉面");
    }];
}
```
3. blcok作为返回值
链式编程是以**点语法**为基础的。这样就需要在OC中使用**点语法**来调用方法。
可以参照OC中使用**点语法**调用get方法方式，来编写链式编程。
这样就需要满足两个条件：1. **方法有返回值**  2. **方法没有参数**
满足get方法条件，还需要使得返回值可以传递参数，就可以借助block来实现
即：当方法的返回值是可执行的block时，就可以实现用**点语法**来调用方法。
```objc
-(NSString *)run{
    NSLog(@"跑步🏃‍♀️🏃🏃‍♀️🏃🏃‍♀️🏃");
    return @"我是普通get方法";
}

-(void (^)(void))walk{
    void(^walk)(void) = ^{
        NSLog(@"普通散步行走");
    };
    return walk;
}

-(Person *(^)(NSString *))chainWalk{
    Person *(^chainWalk)(NSString *) = ^Person *(NSString *place) {
        NSLog(@"在%@广场链式散步",place);
        return self;
    };
    return chainWalk;
}
/// block作为返回值
- (void)testReturnValue {
    NSLog(@"%@",person.run);

    ///block作为返回值
    person.walk();
    ///block作为返回值，block返回对象本省,实现链式编程
    person.chainWalk(@"人民广场").chainWalk(@"奥林匹克公园").chainWalk(@"go home");
}
```
### masonry原理
采用函数式编程：使得所有的逻辑相关的代码放在block中一起执行
mas_makeConstraints执行流程
1. 创建约束制造者，MASConstraintMaker，并且绑定控件
2. 执行mas_makeConstraints传入的Block
3. 让约束制造者安装约束（即将Masonry设置转为NSLayout系统约束）
1. 清空之前所有的约束
2. 遍历约束数组，一个一个的安装，用的就是NSLayoutConstraint来安装约束

### 分析内存的运行机制


//
//  UnitTestDemo
//
//  Created by 尤坤 on 2023/2/9.
//

#import <AppKit/AppKit.h>
#import "Example2.h"

NS_ASSUME_NONNULL_BEGIN

//间接输入

typedef enum : NSUInteger {
    StateWork,
    StateRest
} State;

@interface Worker : NSObject

- (State)getState;

@end













//要解决这个问题，通常可以使用依赖注入（依赖倒置，IoC），依赖倒置是六大设计原则之一，对于单元测试来说尤其有效。实际工程中，大多数应用都是由多个类通过彼此的合作来实现业务逻辑的，这使得每个对象都需要获得与其合作的对象（也就是他所依赖的对象）的引用，如果这个获取过程要靠自身实现，那会导致代码高度耦合并且难以测试。

///After transformation

@protocol TimerManagerProtocol <NSObject>

- (TimeOfDay)getTimeOfDay:(NSDate *)date;

@end

@interface TimeManagerV2: NSObject<TimerManagerProtocol>
@end

@interface WorkerV2 : NSObject

- (instancetype)initWith:(id<TimerManagerProtocol>)timeManager;

- (State)getState;

@end











//类函数, 首先要把类方法改造成成员函数。如果一个函数的输入是类函数的输出，那么这个函数的输入是不可控的，是不可测试的。
@interface TimeManagerWithClassMethod : NSObject

+ (TimeOfDay)getTimeOfDay:(NSDate *)date;

@end











//单例
//通过代码（协议 & 类申明）的方式明确依赖，不要通过一些管道化的技术例如通知中心去抹平依赖关系。依赖产生的额外的例如注入等工作量通过更好的工具框架来解决（比如Gripper）如果有shared单例，大概率模块设计一定有问题；

@interface TimeManagerSingleton : NSObject

@property (nonatomic, class, readonly) TimeManagerSingleton *shared;

- (TimeOfDay)getTimeOfDay:(NSDate *)date;

@end







//系统类
@interface ScreenManager : NSObject

- (CGFloat)getScreenArea;

@end







///After transformation
@protocol IScreen <NSObject>
@property (nonatomic, readonly) CGRect frame;
@end

@interface NSScreen(interface) <IScreen>
@end

@interface ScreenManagerV2 : NSObject

- (instancetype)initWith:(id<IScreen>)screen;
- (CGFloat)getScreenArea;

@end

//对于第三方库，基础库等无法直接修改的类，也可以通过这种方法mock


NS_ASSUME_NONNULL_END

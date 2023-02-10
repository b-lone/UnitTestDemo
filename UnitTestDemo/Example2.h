//
//  Example2.h
//  UnitTestDemo
//
//  Created by 尤坤 on 2023/2/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

//保证函数独立性：函数的执行不依赖外部状态,也不改变外部状态
//直接输入 直接输出

typedef enum : NSUInteger {
    TimeOfDayMorning,
    TimeOfDayNoon,
    TimeOfDayEvening,
    TimeOfDayNight,
} TimeOfDay;


@interface TimeManager : NSObject

- (TimeOfDay)getTimeOfDay;
- (TimeOfDay)getTimeOfDay:(NSDate *)date;

@end


NS_ASSUME_NONNULL_END

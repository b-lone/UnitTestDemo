//
//  UnitTestDemo
//
//  Created by 尤坤 on 2023/2/9.
//

#import "Example3.h"
#import "Example2.h"

@interface Worker()

@property (nonatomic, strong) TimeManager *timeManager;

@end

@implementation Worker

- (State)getState {
    TimeOfDay time = [self.timeManager getTimeOfDay:[NSDate now]];
    switch (time) {
        case TimeOfDayMorning:
        case TimeOfDayNoon:
            return StateWork;
        case TimeOfDayEvening:
        case TimeOfDayNight:
            return StateRest;
    }
}

@end


///After transformation
@implementation TimeManagerV2

- (TimeOfDay)getTimeOfDay:(NSDate *)date {
    NSInteger hour = [[NSCalendar currentCalendar] component:NSCalendarUnitHour fromDate:date];
    
    if (hour >= 0 && hour < 6) {
        return TimeOfDayNight;
    }
    if (hour >= 6 && hour < 12) {
        return TimeOfDayMorning;
    }
    if (hour >= 12 && hour < 18) {
        return TimeOfDayNoon;
    }
    return TimeOfDayEvening;
}

@end


@interface WorkerV2()

@property (nonatomic, strong) id<TimerManagerProtocol> timeManager;

@end

@implementation WorkerV2

- (instancetype)initWith:(id<TimerManagerProtocol>)timeManager {
    if (self = [super init]) {
        _timeManager = timeManager;
    }
    return self;
}

- (State)getState {
    TimeOfDay time = [self.timeManager getTimeOfDay:[NSDate now]];
    switch (time) {
        case TimeOfDayMorning:
        case TimeOfDayNoon:
            return StateWork;
        case TimeOfDayEvening:
        case TimeOfDayNight:
            return StateRest;
    }
}

@end


//类方法
@implementation TimeManagerWithClassMethod

+ (TimeOfDay)getTimeOfDay:(NSDate *)date {
    NSInteger hour = [[NSCalendar currentCalendar] component:NSCalendarUnitHour fromDate:date];
    
    if (hour >= 0 && hour < 6) {
        return TimeOfDayNight;
    }
    if (hour >= 6 && hour < 12) {
        return TimeOfDayMorning;
    }
    if (hour >= 12 && hour < 18) {
        return TimeOfDayNoon;
    }
    return TimeOfDayEvening;
}

@end

//单例

TimeManagerSingleton *sharedTimeManager;

@implementation TimeManagerSingleton

+ (TimeManagerSingleton *)shared {
    if (!sharedTimeManager) {
        sharedTimeManager = [TimeManagerSingleton new];
    }
        
    return sharedTimeManager;
}

- (TimeOfDay)getTimeOfDay:(NSDate *)date {
    NSInteger hour = [[NSCalendar currentCalendar] component:NSCalendarUnitHour fromDate:date];
    
    if (hour >= 0 && hour < 6) {
        return TimeOfDayNight;
    }
    if (hour >= 6 && hour < 12) {
        return TimeOfDayMorning;
    }
    if (hour >= 12 && hour < 18) {
        return TimeOfDayNoon;
    }
    return TimeOfDayEvening;
}

@end


//系统类

@implementation ScreenManager

- (CGFloat)getScreenArea {
    CGRect rect = NSScreen.mainScreen.frame;
    return rect.size.width * rect.size.height;
}

@end

@interface ScreenManagerV2()

@property (nonatomic, strong) id<IScreen> screen;

@end

@implementation ScreenManagerV2

- (instancetype)initWith:(id<IScreen>)screen {
    if(self = [super init]) {
        _screen = screen;
    }
    return self;
}

- (CGFloat)getScreenArea {
    CGRect rect = self.screen.frame;
    return rect.size.width * rect.size.height;
}

@end

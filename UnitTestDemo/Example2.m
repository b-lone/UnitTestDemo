//
//  Example2.m
//  UnitTestDemo
//
//  Created by 尤坤 on 2023/2/9.
//

#import "Example2.h"

@implementation TimeManager

- (TimeOfDay)getTimeOfDay {
    NSInteger hour = [[NSCalendar currentCalendar] component:NSCalendarUnitHour fromDate:[NSDate now]];
    
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

//
//  FakeTimeManager.m
//  UnitTestDemo
//
//  Created by 尤坤 on 2023/2/10.
//

#import "FakeTimeManager.h"

@implementation FakeTimeManager

- (TimeOfDay)getTimeOfDay:(NSDate *)date {
    return _fakeTimeOfDay;
}

@end

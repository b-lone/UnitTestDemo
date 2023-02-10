//
//  Example2_Test.m
//  UnitTest
//
//  Created by 尤坤 on 2023/2/9.
//

#import <XCTest/XCTest.h>
#import "Example2.h"

@interface UnitTest2 : XCTestCase

@property (nonatomic, strong) TimeManager *testObj;

@end

@implementation UnitTest2

- (void)setUp {
    self.testObj = [TimeManager new];
}

- (void)testExample {
    NSInteger noonTimeStamp = 1675929658;
    
    TimeOfDay result = [self.testObj getTimeOfDay:[NSDate dateWithTimeIntervalSince1970:noonTimeStamp]];
    XCTAssertEqual(result, TimeOfDayNoon);
    
    NSInteger eveningTimeStamp = 1675929658 + 3600 * 6;
    result = [self.testObj getTimeOfDay:[NSDate dateWithTimeIntervalSince1970:eveningTimeStamp]];
    XCTAssertEqual(result, TimeOfDayEvening);
    
    NSInteger nightTimeStamp = 1675929658 + 3600 * 6 * 2;
    result = [self.testObj getTimeOfDay:[NSDate dateWithTimeIntervalSince1970:nightTimeStamp]];
    XCTAssertEqual(result, TimeOfDayNight);
    
    NSInteger morningTimeStamp = 1675929658 + 3600 * 6 * 3;
    result = [self.testObj getTimeOfDay:[NSDate dateWithTimeIntervalSince1970:morningTimeStamp]];
    XCTAssertEqual(result, TimeOfDayMorning);
}

@end

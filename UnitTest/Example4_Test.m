//
//  Example4_Test.m
//  UnitTest
//
//  Created by 尤坤 on 2023/2/10.
//

#import <XCTest/XCTest.h>
#import "Example4.h"
#import "FakeTimeManager.h"

@interface FakeLightController : NSObject<ILightingController>

@property (nonatomic, assign) BOOL turnOnCalled;
@property (nonatomic, assign) BOOL turnOffCalled;

@end

@implementation FakeLightController

- (void)turnOn {
    self.turnOnCalled = YES;
}

- (void)turnOff {
    self.turnOffCalled = YES;
}

@end


@interface UnitTest4 : XCTestCase

@property (nonatomic, strong) FakeTimeManager *fakeTimeManager;
@property (nonatomic, strong) FakeLightController *fakeLightController;
@property (nonatomic, strong) RoomV2 *testObj;

@end

@implementation UnitTest4

- (void)setUp {
    self.fakeTimeManager = [FakeTimeManager new];
    self.fakeLightController = [FakeLightController new];
    self.testObj = [[RoomV2 alloc] initWith:self.fakeTimeManager lightingManager:self.fakeLightController];
}

- (void)testExample {
    self.fakeTimeManager.fakeTimeOfDay = TimeOfDayMorning;
    self.fakeLightController.turnOnCalled = NO;
    self.fakeLightController.turnOffCalled = NO;
    [self.testObj actuateLighting];
    XCTAssertFalse(self.fakeLightController.turnOnCalled);
    XCTAssertTrue(self.fakeLightController.turnOffCalled);
    
    self.fakeTimeManager.fakeTimeOfDay = TimeOfDayNoon;
    self.fakeLightController.turnOnCalled = NO;
    self.fakeLightController.turnOffCalled = NO;
    [self.testObj actuateLighting];
    XCTAssertFalse(self.fakeLightController.turnOnCalled);
    XCTAssertTrue(self.fakeLightController.turnOffCalled);
    
    self.fakeTimeManager.fakeTimeOfDay = TimeOfDayEvening;
    self.fakeLightController.turnOnCalled = NO;
    self.fakeLightController.turnOffCalled = NO;
    [self.testObj actuateLighting];
    XCTAssertTrue(self.fakeLightController.turnOnCalled);
    XCTAssertFalse(self.fakeLightController.turnOffCalled);
    
    self.fakeTimeManager.fakeTimeOfDay = TimeOfDayNight;
    self.fakeLightController.turnOnCalled = NO;
    self.fakeLightController.turnOffCalled = NO;
    [self.testObj actuateLighting];
    XCTAssertTrue(self.fakeLightController.turnOnCalled);
    XCTAssertFalse(self.fakeLightController.turnOffCalled);
}

@end

//
//  UnitTestDemo
//
//  Created by 尤坤 on 2023/2/10.
//

#import "Example4.h"
LightingController *sharedInstance;

@implementation LightingController

+ (LightingController *)shared {
    if (!sharedInstance) {
        sharedInstance = [LightingController new];
    }
    return sharedInstance;
}

- (void)turnOn {
    //turn on light
}

- (void)turnOff {
    //turn off light
}

@end

@interface Room()

@property (nonatomic, strong) id<TimerManagerProtocol> obj;

@end

@implementation Room

- (instancetype)initWith:(id<TimerManagerProtocol>)a2 {
    if (self = [super init]) {
        _obj = a2;
    }
    return self;
}

- (void)actuateLighting {
    TimeOfDay time = [self.obj getTimeOfDay:[NSDate now]];
    
    switch (time) {
        case TimeOfDayMorning:
        case TimeOfDayNoon:
            [LightingController.shared turnOn];
            break;
        case TimeOfDayEvening:
        case TimeOfDayNight:
            [LightingController.shared turnOff];
            break;
    }
    
}

@end







@implementation LightingControllerV2

- (void)turnOn {
    //turn on light
}

- (void)turnOff {
    //turn off light
}

@end

@interface RoomV2()

@property (nonatomic, strong) id<TimerManagerProtocol> timeManager;
@property (nonatomic, strong) id<ILightingController> lightController;

@end

@implementation RoomV2

- (instancetype)initWith:(id<TimerManagerProtocol>)timeManager lightingManager:(id<ILightingController>)lightController {
    if (self = [super init]) {
        _timeManager = timeManager;
        _lightController = lightController;
    }
    return self;
}

- (void)actuateLighting {
    TimeOfDay time = [self.timeManager getTimeOfDay:[NSDate now]];
    
    switch (time) {
        case TimeOfDayMorning:
        case TimeOfDayNoon:
            [self.lightController turnOff];
            break;
        case TimeOfDayEvening:
        case TimeOfDayNight:
            [self.lightController turnOn];
            break;
    }
    
}

@end


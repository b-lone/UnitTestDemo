//
//  UnitTestDemo
//
//  Created by 尤坤 on 2023/2/10.
//

#import <AppKit/AppKit.h>
#import "Example3.h"

NS_ASSUME_NONNULL_BEGIN

//间接输出

@interface LightingController: NSObject

@property (nonatomic, class, readonly) LightingController *shared;

- (void)turnOn;
- (void)turnOff;

@end

@interface Room : NSObject

- (instancetype)initWith:(id<TimerManagerProtocol>)a2;

- (void)actuateLighting;

@end






//函数的副作用

@protocol ILightingController <NSObject>

- (void)turnOn;
- (void)turnOff;

@end

@interface LightingControllerV2: NSObject<ILightingController>
@end

@interface RoomV2 : NSObject

- (instancetype)initWith:(id<TimerManagerProtocol>)timeManager lightingManager:(id<ILightingController>)lightingController;

- (void)actuateLighting;

@end

NS_ASSUME_NONNULL_END

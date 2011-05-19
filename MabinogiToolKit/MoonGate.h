
#import <Foundation/Foundation.h>

@interface MoonGate : NSObject {
}
+ (NSDictionary*)gateAtCycleCount:(NSInteger)cycleCount;
+ (NSArray*)timeTable:(NSRange)range;
+ (BOOL)isGateOpen;
+ (NSInteger)currentCycleCount;
@end

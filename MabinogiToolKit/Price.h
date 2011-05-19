
#import <Foundation/Foundation.h>

@interface Price : NSObject {
}
+ (NSArray*)timeTable:(NSRange)range;
+ (NSDictionary*)priceAtCycleCount:(NSInteger)cycleCount;
+ (NSInteger)currentCycleCount;
@end


#import <Foundation/Foundation.h>
#import "ErinnTime.h"

@interface DailyEffect : NSObject {
}
+ (NSArray*)effectsFor:(ErinnWeek)week;
+ (NSArray*)itemsFor:(ErinnWeek)week;
@end

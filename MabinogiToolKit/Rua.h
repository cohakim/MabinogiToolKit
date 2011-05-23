
#import <Foundation/Foundation.h>

typedef enum { RuaIsAbsent = NO, RuaIsAtWork = YES } RuaAttendance;

@interface Rua : NSObject {
}
+ (NSArray*)timeTable:(NSRange)range;
+ (NSDictionary*)attendanceAtCycleCount:(NSInteger)cycleCount;
+ (BOOL)isRuaAttendance;
+ (NSInteger)currentCycleCount;
@end


#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>

@interface TodaysMission : RKObject {
 @private
  NSString *_text;
  NSString *_createdAt;
}
@property (nonatomic, copy) NSString *text;
@property (nonatomic, retain) NSString *createdAt;
- (BOOL)missionExpired;
@end

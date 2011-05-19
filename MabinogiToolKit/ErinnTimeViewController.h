
#import <UIKit/UIKit.h>
#import "ErinnTime.h"

@interface ErinnTimeViewController : UIViewController {
  IBOutlet UIImageView *markImage;
  IBOutlet UILabel *timeLabel;
  IBOutlet UILabel *weekLabel;
  NSTimer *timer;
  NSString *currentErinnTime;
  NSString *currentErinnWeekSymbol;
}
@property (nonatomic, retain) UIImageView *markImage;
@property (nonatomic, retain) UILabel *timeLabel;
@property (nonatomic, retain) UILabel *weekLabel;
@property (nonatomic, assign) NSTimer *timer;
@property (nonatomic, copy) NSString *currentErinnTime;
@property (nonatomic, copy) NSString *currentErinnWeekSymbol;
@end

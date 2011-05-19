
#import <UIKit/UIKit.h>

@interface CreditViewController : UIViewController {
 @private
  NSTimer *timer;
}
@property (nonatomic, assign) NSTimer *timer;
- (IBAction)visitMyTwitterButtonTouched:(id)sender;
- (IBAction)visitMabinyaButtonTouched:(id)sender;
- (IBAction)visitNexonButtonTouched:(id)sender;
@end

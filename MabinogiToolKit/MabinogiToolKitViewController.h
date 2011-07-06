
#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "ErinnTimeViewController.h"
#import "DailyEffectsViewController.h"
#import "MoonGateViewController.h"
#import "PriceViewController.h"
#import "RuaViewController.h"
#import "CreditViewController.h"

@interface MabinogiToolKitViewController : UIViewController <UIScrollViewDelegate> {
 @private
  IBOutlet UIView *staticView;
  IBOutlet UIScrollView *scrollView;
  IBOutlet UIPageControl *pageControl;
}
@property (nonatomic, retain) UIView *staticView;
@property (nonatomic, retain) UIScrollView *scrollView;
@property (nonatomic, retain) UIPageControl *pageControl;
- (IBAction)changePage:(id)sender;
@end

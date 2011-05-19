
#import "ErinnTimeViewController.h"

@interface ErinnTimeViewController ()
- (void)rotateMarkImage;
- (void)refreshTimeLabel;
- (void)refreshWeekLabel;
@end

@implementation ErinnTimeViewController

@synthesize markImage;
@synthesize timeLabel;
@synthesize weekLabel;
@synthesize timer;
@synthesize currentErinnTime;
@synthesize currentErinnWeekSymbol;

#pragma mark -
#pragma mark Private Methods

- (void)rotateMarkImage {
  CGContextRef context = UIGraphicsGetCurrentContext();

  [UIView beginAnimations:nil context:context];
  [UIView setAnimationDuration:1];
  [UIView setAnimationDelegate:self];
  
  CGAffineTransform rotate = CGAffineTransformMakeRotation(0);
  switch ((long long int)[[NSDate date] timeIntervalSince1970] % 4) {
    case 0:
      rotate = CGAffineTransformMakeRotation(M_PI * 90.0f/180.0f);
      break;
    case 1:
      rotate = CGAffineTransformMakeRotation(M_PI * 180.0f/180.0f);
      break;
    case 2:
      rotate = CGAffineTransformMakeRotation(M_PI * 270.0f/180.0f);
      break;
    case 3:
      rotate = CGAffineTransformMakeRotation(M_PI * 360.0f/180.0f);
      markImage.transform = CGAffineTransformMakeRotation(0);		
      break;
  }
  [markImage setTransform:rotate];
  
  [UIView commitAnimations];	
}
   
- (void)refreshTimeLabel {
  self.currentErinnTime = [ErinnTime currentErinnTime];
  [timeLabel setText:currentErinnTime];
}

- (void)refreshWeekLabel {
  self.currentErinnWeekSymbol = [ErinnTime symbolForErinnWeek:[ErinnTime currentErinnWeek]];
  [weekLabel setText:currentErinnWeekSymbol];
}

#pragma mark -
#pragma mark Inherit Methods

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0f
                                                target:self
                                              selector:@selector(fireTimerEvent)
                                              userInfo:nil
                                               repeats:YES];
  [timer fire];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
  [timer invalidate];
  [super viewDidUnload];
}

- (void)dealloc {
  self.currentErinnTime = nil;
  self.currentErinnWeekSymbol = nil;
  self.timer = nil;  
  [super dealloc];
}

#pragma mark -
#pragma mark Timer Event Handlers

- (void)fireTimerEvent {
//  [self rotateMarkImage];
  [self refreshTimeLabel];
  [self refreshWeekLabel];
}

@end

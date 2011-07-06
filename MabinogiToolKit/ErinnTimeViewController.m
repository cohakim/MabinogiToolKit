
#import "ErinnTimeViewController.h"

@interface ErinnTimeViewController ()
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
  [self refreshTimeLabel];
  [self refreshWeekLabel];
}

@end

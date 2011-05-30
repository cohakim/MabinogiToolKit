
#import "WeekEffectViewController.h"

@interface WeekEffectViewController ()
- (void)refreshWeekEffect;
@end

@implementation WeekEffectViewController

@synthesize effectView;
@synthesize timer;
@synthesize effectExplanations;
@synthesize itemExplanations;

#pragma mark -
#pragma mark Private Methods

- (void)refreshWeekEffect {
  self.effectExplanations = [WeekEffect effectsFor:[ErinnTime currentErinnWeek]];
  self.itemExplanations = [WeekEffect itemsFor:[ErinnTime currentErinnWeek]];
  [effectView reloadData];
}

#pragma mark -
#pragma mark Inherit Methods

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    self.effectExplanations = [[NSArray alloc] init];
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
  self.timer = nil;
  self.effectExplanations = nil;
  [super dealloc];
}

#pragma mark -
#pragma mark Timer Event Handlers

- (void)fireTimerEvent {
  [self refreshWeekEffect];
}

#pragma mark -
#pragma mark UITableView Delegate Methods

// -----------------------------------------------------------------------------
// section

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  NSInteger number = 0;
  switch (section) {
    case 0:
      number = [effectExplanations count];
      break;
    case 1:
      number = [itemExplanations count];
      break;
  }
  return number;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
	UIView *sectionView = [[[UIView alloc] init] autorelease];
	[sectionView setBackgroundColor:[UIColor colorWithHue:0.00 saturation:0.00 brightness:0.00 alpha:0.40]];
	UILabel *titleLabel = [[[UILabel alloc] initWithFrame:CGRectMake(10, 0, tableView.frame.size.width, tableView.sectionHeaderHeight)] autorelease];
  [titleLabel setBackgroundColor:[UIColor colorWithHue:0.00 saturation:0.00 brightness:0.00 alpha:0.00]];
  [titleLabel setFont:[UIFont boldSystemFontOfSize:13]];
	[titleLabel setTextColor:[UIColor whiteColor]];
  switch (section) {
    case 0:
      [titleLabel setText:NSLocalizedString(@"Daily Effects", nil)];
      break;
    case 1:
      [titleLabel setText:NSLocalizedString(@"Advanced Play Service", nil)];
      break;
  }
  [sectionView addSubview:titleLabel];
	return sectionView;
}

// -----------------------------------------------------------------------------
// row

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  NSString *text = @"";
  switch (indexPath.section) {
    case 0:
      text = [effectExplanations objectAtIndex:indexPath.row];
      break;
    case 1:
      text = [itemExplanations objectAtIndex:indexPath.row];
      break;
  }
  CGSize ts1 = [text sizeWithFont:[UIFont systemFontOfSize:13]
                constrainedToSize:tableView.frame.size
                    lineBreakMode:UILineBreakModeWordWrap];  
  return ts1.height + 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  NSString *CellIdentifier = @"MyIdentifer";
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if (cell == nil) {
    cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1
                                   reuseIdentifier:CellIdentifier] autorelease];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    [cell.textLabel setFont:[UIFont systemFontOfSize:13]];
    [cell.textLabel setTextColor:[UIColor whiteColor]];
    [cell.textLabel setNumberOfLines:0];
  }
  switch (indexPath.section) {
    case 0:
      [cell.textLabel setText:[effectExplanations objectAtIndex:indexPath.row]];
      break;
    case 1:
      [cell.textLabel setText:[itemExplanations objectAtIndex:indexPath.row]];
      break;
  }

  return cell;
}

@end

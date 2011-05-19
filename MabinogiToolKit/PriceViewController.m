
#import "PriceViewController.h"

@interface PriceViewController ()
- (void)refreshTimeTable;
@end

@implementation PriceViewController

@synthesize priceView;
@synthesize timer;
@synthesize priceTimeTable;

#pragma mark -
#pragma mark Private Methods

- (void)refreshTimeTable {
  self.priceTimeTable = [Price timeTable:NSMakeRange([Price currentCycleCount], 12)];
  [priceView reloadData];
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
  [priceView setSeparatorColor:[UIColor blackColor]];
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
  self.priceTimeTable = nil;
  [super dealloc];
}

#pragma mark -
#pragma mark Timer Event Handlers

- (void)fireTimerEvent {
  [self refreshTimeTable];
}

#pragma mark -
#pragma mark UITableView Delegate Methods

// -----------------------------------------------------------------------------
// section

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [priceTimeTable count];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
	UIView *sectionView = [[[UIView alloc] init] autorelease];
	[sectionView setBackgroundColor:[UIColor colorWithHue:0.00 saturation:0.00 brightness:0.00 alpha:0.40]];
	UILabel *titleLabel = [[[UILabel alloc] initWithFrame:CGRectMake(10, 0, tableView.frame.size.width, tableView.sectionHeaderHeight)] autorelease];
  [titleLabel setBackgroundColor:[UIColor colorWithHue:0.00 saturation:0.00 brightness:0.00 alpha:0.00]];
  [titleLabel setFont:[UIFont boldSystemFontOfSize:13]];
	[titleLabel setTextColor:[UIColor whiteColor]];
	[titleLabel setText:@"プライス"];
	[sectionView addSubview:titleLabel];
	return sectionView;
}

// -----------------------------------------------------------------------------
// row

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  return 28;
}


- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
  if (indexPath.row == 0) {
    //cell.backgroundColor = [UIColor colorWithHue:0.60 saturation:0.09 brightness:0.99 alpha:0.4];
  }
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
    [cell.textLabel setNumberOfLines:1];
    [cell.detailTextLabel setTextColor:[UIColor yellowColor]];  
  }
  NSDictionary *price = [priceTimeTable objectAtIndex:indexPath.row];
  NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
  [formatter setDateFormat:@"HH:mm"];
  
  [cell.textLabel setText:[price objectForKey:@"placeName"]];

  if (indexPath.row == 0) {
    NSDate *closeTime = [[price objectForKey:@"appearanceTime"] dateByAddingTimeInterval:(60*36)];
    int restTime = (int)[closeTime timeIntervalSinceNow];
    NSString *mmss = [NSString stringWithFormat:@"%02i:%02i", restTime / 60, restTime % 60];
    [cell.detailTextLabel setText:mmss];
    [cell.detailTextLabel setTextColor:[UIColor cyanColor]];
    [cell.textLabel setTextColor:[UIColor cyanColor]];
  }
  else {
    NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
    [formatter setDateFormat:@"HH:mm"];
    [cell.detailTextLabel setText:[formatter stringFromDate:[price objectForKey:@"appearanceTime"]]];
    [cell.detailTextLabel setTextColor:[UIColor yellowColor]];
    [cell.textLabel setTextColor:[UIColor whiteColor]];
  }
  
  return cell;
}

@end

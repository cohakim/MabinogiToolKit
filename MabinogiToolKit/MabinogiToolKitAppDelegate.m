
#import "MabinogiToolKitAppDelegate.h"
#import "MabinogiToolKitViewController.h"

@interface MabinogiToolKitAppDelegate ()
@end

@implementation MabinogiToolKitAppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;

#pragma mark -
#pragma mark Private Methods

#pragma mark -
#pragma mark Inherit Methods

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  self.window.rootViewController = self.viewController;
  [UIApplication sharedApplication].idleTimerDisabled = YES;
  
  [self.window makeKeyAndVisible];
  return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
}

- (void)dealloc {
  [_window release];
  [_viewController release];
  [super dealloc];
}

@end

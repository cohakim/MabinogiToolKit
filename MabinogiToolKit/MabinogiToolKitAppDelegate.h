//
//  MabinogiToolKitAppDelegate.h
//  MabinogiToolKit
//
//  Created by kimihiko hattori on 5/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MabinogiToolKitViewController;

@interface MabinogiToolKitAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet MabinogiToolKitViewController *viewController;

@end

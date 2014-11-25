//
//  iTennisAppDelegate.m
//  iTennis
//
//  Created by Joseph Gonzalez on 2/10/10.
//  Copyright Atlantic Southeast Airlines 2010. All rights reserved.
//

#import "iTennisAppDelegate.h"
#import "iTennisViewController.h"

@implementation iTennisAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    viewController = [[SplashViewController alloc] init];
	// Override point for customization after app launch    
    //[window addSubview:viewController.view];
    [window addSubview:[viewController view]];
	
	[window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end

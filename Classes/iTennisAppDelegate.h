//
//  iTennisAppDelegate.h
//  iTennis
//
//  Created by Joseph Gonzalez on 2/10/10.
//  Copyright Atlantic Southeast Airlines 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SplashViewController.h"

@class iTennisViewController;

@interface iTennisAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	SplashViewController *viewController;
	//iTennisViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet SplashViewController *viewController;

//@property (nonatomic, retain) IBOutlet iTennisViewController *viewController;

@end


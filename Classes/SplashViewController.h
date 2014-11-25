//
//  SplashViewController.h
//  iTennis
//
//  Created by Joseph Gonzalez on 2/12/10.
//  Copyright 2010 Atlantic Southeast Airlines. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iTennisViewController.h"


@interface SplashViewController : UIViewController {
	NSTimer *timer;
	UIImageView *splashImageView;
	
	iTennisViewController *viewController;

}

@property (nonatomic, retain) NSTimer *timer;
@property (nonatomic, retain) UIImageView *splashImageView;
@property (nonatomic, retain) iTennisViewController *viewController;




@end

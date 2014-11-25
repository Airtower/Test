//
//  SplashViewController.m
//  iTennis
//
//  Created by Joseph Gonzalez on 2/12/10.
//  Copyright 2010 Atlantic Southeast Airlines. All rights reserved.
//

#import "SplashViewController.h"


@implementation SplashViewController

@synthesize timer, splashImageView, viewController;


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
	//init the view
	CGRect appFrame = [[UIScreen mainScreen] applicationFrame];
	UIView *view = [[UIView alloc] initWithFrame:appFrame];
	view.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
	self.view = view;
	
	[view release];
	
	splashImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"splash.png"]];
	splashImageView.frame = CGRectMake(0, 0, 320, 480);
	[self.view addSubview:splashImageView];
	
	viewController = [[iTennisViewController alloc] initWithNibName:@"iTennisViewController" bundle:[NSBundle mainBundle]];
	viewController.view.alpha = 0.0;
	[self.view addSubview:viewController.view];
	
	timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(fadeScreen) userInfo:nil repeats:NO];
	
}

-(void) fadeScreen {
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.75];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(finishFading)];
	self.view.alpha = 0.0;
	[UIView commitAnimations];
}

-(void) finishFading {

	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.75];
	self.view.alpha = 1.0;
	viewController.view.alpha = 1.0;
	[UIView commitAnimations];
	[splashImageView removeFromSuperview];

}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end

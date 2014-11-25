//
//  iTennisViewController.m
//  iTennis
//
//  Created by Joseph Gonzalez on 2/10/10.
//  Copyright Atlantic Southeast Airlines 2010. All rights reserved.
//

#import "iTennisViewController.h"

#define kGameStateRunning 1
#define kGameStatePaused 0

#define kBallSpeedX 10
#define kBallSpeedY 15

#define kCompMoveSpeed 15

#define kScoreToWin 5
 
@implementation iTennisViewController

@synthesize ball, raquet_green, raquet_yellow, tapToBegin;
@synthesize player_score, computer_score, ballVelocity;
@synthesize gameState;//, computer_score_value, player_score_value;
@synthesize volleyFileID, clappingFileID;



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.gameState = kGameStatePaused;
	ballVelocity = CGPointMake(kBallSpeedX, kBallSpeedY);
	
	//Sound Implementation
	NSString *clapPath = [[NSBundle mainBundle] pathForResource:@"clapping crowd studio 01" ofType:@"caf"];
	CFURLRef clapURL = (CFURLRef ) [NSURL fileURLWithPath:clapPath];
	AudioServicesCreateSystemSoundID(clapURL, &clappingFileID);
	
	NSString *volleyPath = [[NSBundle mainBundle] pathForResource:@"tennis volley 01" ofType:@"caf"];
	CFURLRef volleyURL = (CFURLRef ) [NSURL fileURLWithPath:volleyPath];
	AudioServicesCreateSystemSoundID(volleyURL, &volleyFileID);
	
	[NSTimer scheduledTimerWithTimeInterval:0.05 target:self 
									 selector:@selector(gameLoop) userInfo:nil repeats:YES];
}

-(void) gameLoop {
	if (gameState == kGameStateRunning) {
		ball.center = CGPointMake(ball.center.x + ballVelocity.x, ball.center.y + ballVelocity.y);
		
		if (ball.center.x > self.view.bounds.size.width || ball.center.x < 0) {
			ballVelocity.x = -ballVelocity.x;
		}
		if (ball.center.y > self.view.bounds.size.height || ball.center.y < 0) {
			ballVelocity.y = -ballVelocity.y;
		}
		else {
			if (tapToBegin.hidden) {
				//tapToBegin.hidden = NO;
			}
		}//end of else
	}//end of IF gameState
	
	//Collision Detection
	
	if(CGRectIntersectsRect(ball.frame, raquet_yellow.frame)) {
		if (ball.center.y < raquet_yellow.center.y) {
			ballVelocity.y = -ballVelocity.y;
			//NSLog(@"%f %f", ball.center, raquet_green.center);
			AudioServicesPlaySystemSound(volleyFileID);
		}
	}
	
	if(CGRectIntersectsRect(ball.frame, raquet_green.frame)) {
		if (ball.center.y > raquet_green.center.y) {
			ballVelocity.y = -ballVelocity.y;
			AudioServicesPlaySystemSound(volleyFileID);
		}
	}
	
	//Begin AI
	if (ball.center.y <= self.view.center.y) {
		if (ball.center.x < raquet_green.center.x) {
			CGPoint compLocation = CGPointMake(raquet_green.center.x - kCompMoveSpeed, raquet_green.center.y);
			raquet_green.center = compLocation;
		}
		if (ball.center.x > raquet_green.center.x) {
			CGPoint compLocation = CGPointMake(raquet_green.center.x + kCompMoveSpeed, raquet_green.center.y);
			raquet_green.center = compLocation;
		}
	}
	
	//Scoreing!
	if (ball.center.y <= 0) {
		player_score_value++;
		[self Reset:(player_score_value >= kScoreToWin)];
	}
	if (ball.center.y >= self.view.bounds.size.height) {
		comp_score_value++;
		[self Reset:(comp_score_value >= kScoreToWin)];
	}
	
	
	
}//end of gameLoop

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	if (gameState==kGameStatePaused) {
		tapToBegin.hidden = YES;
		gameState = kGameStateRunning;
	}
	else if (gameState == kGameStateRunning) {
		[self touchesMoved:touches withEvent:event];
	}

}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	UITouch *touch = [[event allTouches] anyObject];
	CGPoint location = [touch locationInView:touch.view];
	CGPoint xLocation = CGPointMake(location.x, raquet_yellow.center.y);
	raquet_yellow.center = xLocation;
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

-(void) Reset:(BOOL)newGame {
	self.gameState = kGameStatePaused;
	ball.center = self.view.center;
	AudioServicesPlaySystemSound(clappingFileID);
	
	if(newGame) {
		if (comp_score_value > player_score_value) {
			tapToBegin.text = @"Computer Wins!";
			tapToBegin.hidden = NO;
		}
		else {
			tapToBegin.text = @"Player Wins!";
			tapToBegin.hidden = NO;
		}
		comp_score_value = 0;
		player_score_value = 0;
	}
	else {
		tapToBegin.text = @"Tap To Begin";
		tapToBegin.hidden = NO;
	}
	
	player_score.text = [NSString stringWithFormat:@"%d", player_score_value];
	computer_score.text = [NSString stringWithFormat:@"%d", comp_score_value];
	
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
	[ball release];
	[raquet_yellow release];
	[raquet_green release];
	[player_score release];
	[computer_score release];
	[tapToBegin release];
}

@end

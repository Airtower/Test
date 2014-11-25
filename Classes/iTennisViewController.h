//
//  iTennisViewController.h
//  iTennis
//
//  Created by Joseph Gonzalez on 2/10/10.
//  Copyright Atlantic Southeast Airlines 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>

@interface iTennisViewController : UIViewController {

	IBOutlet UIImageView *ball;
	IBOutlet UIImageView *raquet_green;
	IBOutlet UIImageView *raquet_yellow;
	IBOutlet UILabel *tapToBegin;
	
	IBOutlet UILabel *player_score;
	IBOutlet UILabel *computer_score;
	
	CGPoint ballVelocity;
	
	NSInteger gameState;
	
	NSInteger player_score_value;
	NSInteger comp_score_value;
	
	SystemSoundID volleyFileID;
	SystemSoundID clappingFileID;
	
}

@property (nonatomic, retain) IBOutlet UIImageView *ball;
@property (nonatomic, retain) IBOutlet UIImageView *raquet_yellow;
@property (nonatomic, retain) IBOutlet UIImageView *raquet_green;
@property (nonatomic, retain) IBOutlet UILabel *tapToBegin;

@property (nonatomic, retain) IBOutlet UILabel *player_score;
@property (nonatomic, retain) IBOutlet UILabel *computer_score;

@property (nonatomic) CGPoint ballVelocity;
@property (nonatomic) NSInteger gameState;

@property (nonatomic) SystemSoundID volleyFileID;
@property (nonatomic) SystemSoundID clappingFileID;


-(void)Reset:(BOOL) newGame;

@end


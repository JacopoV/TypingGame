//
//  PlayViewController.h
//  TypingGame
//
//  Created by Jacopo Volpin on 18/05/10.
//  Copyright 2010 UniPD. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PlayViewController : UIViewController <UIAlertViewDelegate>{
	IBOutlet UITextField *word;
	IBOutlet UITextField *userWord;
	IBOutlet UILabel *time;
	IBOutlet UILabel *score;
	IBOutlet UIButton *menuButton;
	IBOutlet NSArray *wordList;
	IBOutlet UIImageView *comboImg;
	IBOutlet NSInteger combo;
	IBOutlet BOOL check;

}

@property (nonatomic, retain) IBOutlet UITextField *word;
@property (nonatomic, retain) IBOutlet UITextField *userWord;
@property (nonatomic, retain) IBOutlet UILabel *time;
@property (nonatomic, retain) IBOutlet UILabel *score;
@property (nonatomic, retain) IBOutlet UIButton *menuButton;
@property (nonatomic, retain) IBOutlet NSArray *wordList;
@property (nonatomic, retain) IBOutlet UIImageView *comboImg;

- (IBAction)goToMenu: (UIButton *)sender;
- (void)startTimeThread;
- (void)hideComboImg;

@end

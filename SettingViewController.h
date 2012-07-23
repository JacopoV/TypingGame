//
//  SettingViewController.h
//  TypingGame
//
//  Created by Jacopo Volpin on 17/05/10.
//  Copyright 2010 UniPD. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SettingViewController : UIViewController <UIAlertViewDelegate>{
	IBOutlet UIButton *menuButton;
	IBOutlet UISegmentedControl *timeDiff;
	IBOutlet UISegmentedControl *wordsDiff;
	IBOutlet UITextField *name;

}

@property (nonatomic, retain) UIButton *menuButton;
@property (nonatomic, retain) UISegmentedControl *timeDiff;
@property (nonatomic, retain) UISegmentedControl *wordsDiff;
@property (nonatomic, retain) UITextField *name;

-(IBAction)goToMenu: (UIButton *)sender;
-(IBAction)modifyTimeDiff: (UISegmentedControl *)sender;
-(IBAction)modifyWordsDiff: (UISegmentedControl *)sender;

@end

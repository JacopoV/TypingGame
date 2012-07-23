//
//  MenuViewController.h
//  TypingGame
//
//  Created by Jacopo Volpin on 17/05/10.
//  Copyright 2010 UniPD. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MenuViewController : UIViewController {
	IBOutlet UIButton *playButton;
	IBOutlet UIButton *settingButton;
	IBOutlet UIButton *updateButton;
	IBOutlet UIButton *billboards;
}
	
@property (nonatomic, retain) UIButton *playButton;
@property (nonatomic, retain) UIButton *settingButton;
@property (nonatomic, retain) UIButton *updateButton;
@property (nonatomic, retain) UIButton *billboards;

-(IBAction)goToPlay: (UIButton *)sender;
-(IBAction)goToSettings: (UIButton *)sender;
-(IBAction)goToUpdate: (UIButton *)sender;
-(IBAction)goToBillBoards: (UIButton *)sender;

@end

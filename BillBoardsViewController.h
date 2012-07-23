//
//  BillBoardsViewController.h
//  TypingGame
//
//  Created by Jacopo Volpin on 25/05/10.
//  Copyright 2010 UniPD. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface BillBoardsViewController : UIViewController {

	IBOutlet UIButton *goToMenu;
	
}

@property (nonatomic, retain) IBOutlet UIButton *goToMenu;

-(IBAction)goToMenu: (UIButton *)sender;


@end

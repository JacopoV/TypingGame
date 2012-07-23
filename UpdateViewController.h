//
//  UpdateViewController.h
//  TypingGame
//
//  Created by Jacopo Volpin on 22/05/10.
//  Copyright 2010 UniPD. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UpdateViewController : UIViewController {

	IBOutlet UIButton *updateButton;
	IBOutlet UIActivityIndicatorView *loading;
	IBOutlet UILabel *cVersion;
}

@property (nonatomic, retain) IBOutlet UIButton* updateButton;
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *loading;
@property (nonatomic, retain) IBOutlet UILabel *cVersion;

-(IBAction)updateNow: (UIButton *)sender;

@end

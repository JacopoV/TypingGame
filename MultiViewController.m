    //
//  MultiViewController.m
//  TypingGame
//
//  Created by Jacopo Volpin on 17/05/10.
//  Copyright 2010 UniPD. All rights reserved.
//

#import "MultiViewController.h"
#import "MenuViewController.h"
#import	"SettingViewController.h"
#import "PlayViewController.h"
#import "UpdateViewController.h"
#import "BillBoardsViewController.h"

UIViewController *currentView;

@implementation MultiViewController

- (void) displayView:(int)intNewView {
	NSLog(@"%i", intNewView);
	[currentView.view removeFromSuperview];
	[currentView release];
	switch (intNewView) {
		case 1:
			currentView = [[MenuViewController alloc] init];
			break;
		case 2:
			currentView = [[SettingViewController alloc] init];
			break;
		case 3:
			currentView = [[PlayViewController alloc] init];
			break;
		case 4:
			currentView = [[MenuViewController alloc] init];
			break;
		case 5:
			currentView = [[UpdateViewController alloc] init];
			break;
		case 6:
			currentView = [[BillBoardsViewController alloc] init];
			break;
	}
	
	[UIView beginAnimations:@"split" context:nil];
	[UIView setAnimationDuration:1.0];
	[self.view addSubview:currentView.view];
	if (intNewView==1 || intNewView==5 || intNewView==6) {
		[UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.view cache:YES];
	}
	if (intNewView==2) {
		[UIView setAnimationTransition:UIViewAnimationCurveEaseOut forView:self.view cache:YES];
	}
	if (intNewView==3) {
		[UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.view cache:YES];
	}
	if (intNewView==4) {
		[UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.view cache:YES];
	}
	[UIView commitAnimations];
	
}

- (void)viewDidLoad {
	// display Welcome screen
	currentView = [[MenuViewController alloc] init];
	[self.view addSubview:currentView.view];
	
	[super viewDidLoad];
}



- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)dealloc {
    [super dealloc];
}


@end

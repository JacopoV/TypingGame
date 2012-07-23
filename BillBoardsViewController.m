    //
//  BillBoardsViewController.m
//  TypingGame
//
//  Created by Jacopo Volpin on 25/05/10.
//  Copyright 2010 UniPD. All rights reserved.
//

#import "BillBoardsViewController.h"
#import "TypingGameAppDelegate.h"


@implementation BillBoardsViewController

@synthesize goToMenu;

- (IBAction)goToMenu: (UIButton *)sender{
	
	TypingGameAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
	[appDelegate displayView:1];
}


-(void)viewDidLoad{

	UILabel * l = [UILabel new];
	l.text=@"TEST";
	
	l.frame = CGRectMake(100, 130, 80, 40);
	[self.view addSubview:l];
	
	
	
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[goToMenu release];
    [super dealloc];
}


@end

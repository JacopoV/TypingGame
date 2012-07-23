    //
//  MenuViewController.m
//  TypingGame
//
//  Created by Jacopo Volpin on 17/05/10.
//  Copyright 2010 UniPD. All rights reserved.
//

#import "MenuViewController.h"
#import "TypingGameAppDelegate.h"
#import "SettingViewController.h"


@implementation MenuViewController

@synthesize playButton,settingButton,updateButton, billboards;

-(IBAction) goToPlay: (UIButton *)sender{
	
	
	
	TypingGameAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
	
	if([appDelegate.pref objectForKey:@"start"] == nil){
		
		NSString *msg = [NSString stringWithFormat:@"No words loaded and no internet connection. At first launch must be updated." ];
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:msg 
													   delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		
		[alert show];
		[alert release];
		
		[appDelegate displayView:5];
	}
	if([[appDelegate.pref objectForKey:@"start"] isEqualToString:@"YES"]) {
		//andare alla finestra di update! (vale come primo avvio del gioco)
		[appDelegate displayView:3];
		
	}

	
	
}

-(IBAction) goToSettings: (UIButton *)sender{

	TypingGameAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
	[appDelegate displayView:2];
	
}

-(IBAction) goToUpdate: (UIButton *)sender{
	
	TypingGameAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
	[appDelegate displayView:5];
	
}

-(IBAction) goToBillBoards: (UIButton *)sender{
	
	TypingGameAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
	[appDelegate displayView:6];
	
	
}


- (void)viewDidLoad {
	
	//controllo versione per le parole
	TypingGameAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
	NSURL *url = [NSURL URLWithString:@"http://typinggameiphone.altervista.org/vers.txt"];
	NSString *currentVersion = [NSString stringWithContentsOfURL:url];
	
	if ([[appDelegate.pref objectForKey:@"version"] isEqualToString:currentVersion]) {
		NSLog(@"no new words");
	}
	else {
		if ([appDelegate.pref objectForKey:@"start"] != nil) {
			appDelegate.version = currentVersion;
			[appDelegate.pref setObject:appDelegate.version forKey:@"version"];
			NSString *msg = [NSString stringWithFormat:@"New words for download!\n Go to Update!" ];
			UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:msg 
														   delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
			
			[alert show];
			[alert release];
		}
		
	}

	
	
	[super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


- (void)dealloc {
	[playButton release];
	[settingButton release];
    [super dealloc];
}


@end

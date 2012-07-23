    //
//  SettingViewController.m
//  TypingGame
//
//  Created by Jacopo Volpin on 17/05/10.
//  Copyright 2010 UniPD. All rights reserved.
//

#import "SettingViewController.h"
#import "TypingGameAppDelegate.h"

@implementation SettingViewController

@synthesize menuButton, timeDiff, wordsDiff, name;


-(IBAction)goToMenu: (UIButton *)sender{
	
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Setting saved" 
			delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	
	[alert show];
	[alert release];
}

- (void)alertView:(UIAlertView *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
	
	if (buttonIndex == 0)
	{
		TypingGameAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
		//[appDelegate.pref synchronize];
		[appDelegate displayView:1];
	}
	
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField{
	
	TypingGameAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
	appDelegate.namePlayer = name.text;
	name.text = appDelegate.namePlayer;
	[appDelegate.pref setObject:appDelegate.namePlayer forKey:@"namePlayer"];
	[name resignFirstResponder];
	
	
}


- (IBAction)modifyTimeDiff: (UISegmentedControl *)sender{
	
	TypingGameAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
	if( [sender selectedSegmentIndex] == 0 ) 
		appDelegate.timeDiffValue = @"0"; 
	
	if( [sender selectedSegmentIndex] == 1 ) 
		appDelegate.timeDiffValue = @"1"; 
	
	if( [sender selectedSegmentIndex] == 2 )
		appDelegate.timeDiffValue = @"2";
	
	
	[appDelegate.pref setObject:appDelegate.timeDiffValue forKey:@"timeDiffValue"];
}


- (IBAction)modifyWordsDiff: (UISegmentedControl *)sender{
	
	TypingGameAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
	if( [sender selectedSegmentIndex] == 0 )
		appDelegate.wordsDiffValue = @"0";
		
	if( [sender selectedSegmentIndex] == 1 ) 
		appDelegate.wordsDiffValue = @"1"; 
	
	if( [sender selectedSegmentIndex] == 2 ) 
		appDelegate.wordsDiffValue = @"2";
	
	[appDelegate.pref setObject:appDelegate.wordsDiffValue forKey:@"wordsDiffValue"];
	
	
}


- (void)viewDidLoad {
	
	
	TypingGameAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
	NSString *data = [appDelegate.pref objectForKey:@"timeDiffValue"];
	if([data isEqualToString: @"0"])
		self.timeDiff.selectedSegmentIndex=0;
	if([data isEqualToString: @"1"])
		self.timeDiff.selectedSegmentIndex=1;
	if([data isEqualToString: @"2"])
		self.timeDiff.selectedSegmentIndex=2;
	
	data = [appDelegate.pref objectForKey:@"wordsDiffValue"];
	if([data isEqualToString: @"0"])
		self.wordsDiff.selectedSegmentIndex=0;
	if([data isEqualToString: @"1"])
		self.wordsDiff.selectedSegmentIndex=1;
	if([data isEqualToString: @"2"])
		self.wordsDiff.selectedSegmentIndex=2;
	
	data = [appDelegate.pref objectForKey:@"namePlayer"];
	if (data != nil) {
		name.text=data;
	}
	
	[super viewDidLoad];
	
	
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


- (void)dealloc {
	[menuButton release];
	[timeDiff release];
	[wordsDiff release];
    [super dealloc];
}


@end

//
//  UpdateViewController.m
//  TypingGame
//
//  Created by Jacopo Volpin on 22/05/10.
//  Copyright 2010 UniPD. All rights reserved.
//



#import "UpdateViewController.h"
#import "TypingGameAppDelegate.h"



@implementation UpdateViewController

@synthesize updateButton,loading,cVersion;


-(IBAction)updateNow: (UIButton *)sender{
	
	TypingGameAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
	
	
	
	NSURL *url = [NSURL URLWithString:@"http://typinggameiphone.altervista.org/easy.txt"];
	appDelegate.wordsEasyURL= [NSString stringWithContentsOfURL:url]; 
	
	url = [NSURL URLWithString:@"http://typinggameiphone.altervista.org/medium.txt"];
	appDelegate.wordsMediumURL= [NSString stringWithContentsOfURL:url]; 
	
	url = [NSURL URLWithString:@"http://typinggameiphone.altervista.org/hard.txt"];
	appDelegate.wordsHardURL= [NSString stringWithContentsOfURL:url]; 
	
	
	
	if (appDelegate.wordsEasyURL!=nil || appDelegate.wordsMediumURL!=nil || appDelegate.wordsHardURL!=nil) {
		
		appDelegate.start=@"YES";
		[appDelegate.pref setObject:appDelegate.start forKey:@"start"];
		[appDelegate.pref setObject:appDelegate.wordsEasyURL forKey:@"wordsEasyURL"];
		[appDelegate.pref setObject:appDelegate.wordsMediumURL forKey:@"wordsMediumURL"];
		[appDelegate.pref setObject:appDelegate.wordsHardURL forKey:@"wordsHardURL"];
		
		NSURL *url = [NSURL URLWithString:@"http://typinggameiphone.altervista.org/vers.txt"];
		NSString *currentVersion = [NSString stringWithContentsOfURL:url];
		appDelegate.version = currentVersion;
		[appDelegate.pref setObject:appDelegate.version forKey:@"version"];
		
	    [appDelegate displayView:3];
		
	}
	else{
		NSString *msg = [NSString stringWithFormat:@"No internet connection found!" ];
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:msg 
													   delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		
		[alert show];
		[alert release];
	}
	
	
}

-(void)viewDidLoad{

	TypingGameAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];

	cVersion.text = [appDelegate.pref objectForKey:@"version"];
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
    [super dealloc];
}


@end

    //
//  PlayViewController.m
//  TypingGame
//
//  Created by Jacopo Volpin on 18/05/10.
//  Copyright 2010 UniPD. All rights reserved.
//

#import "PlayViewController.h"
#import "TypingGameAppDelegate.h"


@implementation PlayViewController

@synthesize word,userWord,time,score,menuButton,wordList,comboImg;

- (IBAction)goToMenu: (UIButton *)sender{

	TypingGameAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
	[appDelegate displayView:1];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{

	//controllare che la parola sia corretta, aumentare score e resettare il tempo
	
	TypingGameAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
	
	
	
	if ([[appDelegate.pref objectForKey:@"wordsDiffValue"] isEqualToString:@"0"])
		wordList = [[[NSString alloc] initWithString:[appDelegate.pref objectForKey:@"wordsEasyURL"]] componentsSeparatedByString: @","];
	
	if ([[appDelegate.pref objectForKey:@"wordsDiffValue"] isEqualToString:@"1"])
		wordList = [[[NSString alloc] initWithString:[appDelegate.pref objectForKey:@"wordsMediumURL"]] componentsSeparatedByString: @","];
	
	if ([[appDelegate.pref objectForKey:@"wordsDiffValue"] isEqualToString:@"2"])
		wordList = [[[NSString alloc] initWithString:[appDelegate.pref objectForKey:@"wordsHardURL"]] componentsSeparatedByString: @","];
	
	NSLog(@"PUNTO 1");
		
	if ([word.text isEqualToString: userWord.text]) {
		combo+=1;
		NSInteger v=[score.text intValue];
		if(combo > 9){
			//far vedere un immagine e rimuoverla dopo 3 secondi con un thread
			v = v*2;
			combo=0;
			NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
			check=YES;
			[NSThread sleepForTimeInterval:0];  
			[self performSelectorOnMainThread:@selector(hideComboImg) withObject:nil waitUntilDone:NO];  
			[pool release];
									  
									  
		}
		else {
			v+=5;
		}
		NSString *n=[NSString stringWithFormat:@"%d", v];
		score.text=n;
		
		if([appDelegate.timeDiffValue isEqualToString: @"0"])
			time.text = @"10";
		if([appDelegate.timeDiffValue isEqualToString: @"1"])
			time.text = @"06";
		if([appDelegate.timeDiffValue isEqualToString: @"2"])
			time.text = @"04";
		userWord.text = @"";
		
		
		
		NSUInteger nRandom = arc4random() % [wordList count]-1;
		
		if (nRandom>[wordList count]) {
			nRandom=[wordList count]-10;
		}
		 
		 
		word.text = [[wordList objectAtIndex:nRandom] uppercaseString];
	}
	
	else {
		int actual = [time.text intValue];
		if (actual>1) {
			actual-=2;
		}
		NSString *n=[NSString stringWithFormat:@"0%d", actual];
		time.text=n;
		actual = [score.text intValue];   
		if (actual>2) 
			actual-=2;
		n=[NSString stringWithFormat:@"%d", actual];
		score.text=n;
		combo=0;
		   
	}
	
	 
	return YES;
	
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{

	//inizia la partita al primo click della textfield
	//e deve iniziare il thread per la riduzione del tempo
	
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    [NSThread sleepForTimeInterval:0];  
    [self performSelectorOnMainThread:@selector(startTimeThread) withObject:nil waitUntilDone:NO];  
    [pool release];
	
}

- (void)hideComboImg{

	if (check){
		[comboImg setHidden:NO];
		check=NO;
	}
	else {
		[comboImg setHidden:YES];
	}

	[NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(hideComboImg) userInfo:nil repeats:NO];

	
	
}

- (void)startTimeThread{
	
	int actual = [time.text intValue]; 
	if (actual>0) {
		actual-=1;
		NSString *n=[NSString stringWithFormat:@"0%d", actual];
		time.text=n;
		[NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(startTimeThread) userInfo:nil repeats:NO];
	}
	else{
		/*
		// ---- test
		NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,  NSUserDomainMask, YES);
		NSString *documentsDirectoryPath = [paths objectAtIndex:0];
		NSString *filePath = [documentsDirectoryPath  stringByAppendingPathComponent:@"myfile.conf"];
		
		NSString *settings = @"1.0,0.0,0.0,0,";
		NSData* settingsData;
		settingsData = [settings dataUsingEncoding: NSASCIIStringEncoding];
		
		if ([settingsData writeToFile:filePath atomically:YES])
			NSLog(@"writeok");
		// ---- test
		
		*/
		NSString *msg = [NSString stringWithFormat:@"Time is up! YOU LOSE! \n SCORE : %d",[score.text intValue]];
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:msg 
													   delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		
		
		
		// ---- test
		//
		//
		//NSString *myMoves = [NSString stringWithContentsOfFile:filePath];
		//NSLog(myMoves);
		//
		//
		// ---- test
		
		[alert show];
		[alert release];
		TypingGameAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
		[appDelegate displayView:4];
		
		
		
		
	}
}

- (void)viewDidLoad{
	
	TypingGameAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
	
	combo=0;
	score.text=@"0";
	
	if([appDelegate.pref objectForKey:@"timeDiffValue"] == nil && [appDelegate.pref objectForKey:@"wordsDiffValuee"] == nil){
		
		if ([appDelegate.wordsDiffValue isEqualToString:@"0"])
			wordList = [[[NSString alloc] initWithString:[appDelegate.pref objectForKey:@"wordsEasyURL"]] componentsSeparatedByString: @","];
		
		if ([appDelegate.wordsDiffValue isEqualToString:@"1"]) 
			wordList = [[[NSString alloc] initWithString:[appDelegate.pref objectForKey:@"wordsMediumURL"]] componentsSeparatedByString: @","];
		
		if ([appDelegate.wordsDiffValue isEqualToString:@"2"]) 
			wordList = [[[NSString alloc] initWithString:[appDelegate.pref objectForKey:@"wordsHardURL"]] componentsSeparatedByString: @","];
		
		if([appDelegate.timeDiffValue isEqualToString: @"0"])
			time.text = @"10";
		if([appDelegate.timeDiffValue isEqualToString: @"1"])
			time.text = @"06";
		if([appDelegate.timeDiffValue isEqualToString: @"2"])
			time.text = @"04";
	}
	else{
		
		if ([[appDelegate.pref objectForKey:@"wordsDiffValue"] isEqualToString:@"0"])
			wordList = [[[NSString alloc] initWithString:[appDelegate.pref objectForKey:@"wordsEasyURL"]] componentsSeparatedByString: @","];
		
		if ([[appDelegate.pref objectForKey:@"wordsDiffValue"] isEqualToString:@"1"])
			wordList = [[[NSString alloc] initWithString:[appDelegate.pref objectForKey:@"wordsMediumURL"]] componentsSeparatedByString: @","];
		
		if ([[appDelegate.pref objectForKey:@"wordsDiffValue"] isEqualToString:@"2"])
			wordList = [[[NSString alloc] initWithString:[appDelegate.pref objectForKey:@"wordsHardURL"]] componentsSeparatedByString: @","];
		
		if ([[appDelegate.pref objectForKey:@"timeDiffValue"] isEqualToString:@"0"])
			time.text = @"10";
		if ([[appDelegate.pref objectForKey:@"timeDiffValue"] isEqualToString:@"1"])
			time.text = @"06";
		if ([[appDelegate.pref objectForKey:@"timeDiffValue"] isEqualToString:@"2"])
			time.text = @"04";
		
		
		
	}
	
	
	
	NSUInteger nRandom = 1+arc4random() % [wordList count] ;
	word.text = [[wordList objectAtIndex:nRandom] uppercaseString];
	
	[super viewDidLoad];
	
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
	[word release];
	[userWord release];
	[time release];
	[score release];
	[menuButton release];	
	[comboImg release];
    [super dealloc];
}


@end

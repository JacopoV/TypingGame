//
//  TypingGameAppDelegate.m
//  TypingGame
//
//  Created by Jacopo Volpin on 17/05/10.
//  Copyright UniPD 2010. All rights reserved.
//

#import "TypingGameAppDelegate.h"
#import "MultiViewController.h"

@implementation TypingGameAppDelegate

@synthesize window;
@synthesize viewController;
@synthesize timeDiffValue, wordsDiffValue;
@synthesize pref, wordsEasyURL,wordsMediumURL,wordsHardURL,start,namePlayer,version;


-(void) displayView:(int)intNewView {
	[viewController displayView:intNewView];
}

- (void)applicationDidFinishLaunching:(UIApplication *)application {
	[application setStatusBarStyle:UIStatusBarStyleBlackTranslucent];
	
	pref=[NSUserDefaults standardUserDefaults];
	
	if ([pref objectForKey:@"timeDiffValue"] == nil || [pref objectForKey:@"wordsDiffValue"] == nil) {
		timeDiffValue = @"0";
		wordsDiffValue = @"0";
		[pref setObject:timeDiffValue forKey:@"timeDiffValue"];
		[pref setObject:wordsDiffValue forKey:@"wordsDiffValue"];
	}
	
	
	
	if ([pref objectForKey:@"namePlayer"] == nil) {
		[namePlayer initWithString:@"Player1"]; 
	}
	
	if ([pref objectForKey:@"version"] == nil) {
		version = @"n/a";
		[pref setObject:version forKey:@"version"];
	}
	
	
	[window addSubview:viewController.view];
	[window makeKeyAndVisible];
}

- (void)dealloc {
    [window release];
	[viewController release];
	[timeDiffValue release];
	[wordsDiffValue release];
	[wordsEasyURL release];
	[wordsMediumURL release];
	[wordsHardURL release];
	[start release];
    [super dealloc];
}


@end

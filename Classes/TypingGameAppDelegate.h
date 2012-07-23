//
//  TypingGameAppDelegate.h
//  TypingGame
//
//  Created by Jacopo Volpin on 17/05/10.
//  Copyright UniPD 2010. All rights reserved.
//

#import <UIKit/UIKit.h>


@class MultiViewController;

@interface TypingGameAppDelegate : NSObject <UIApplicationDelegate>{
    UIWindow *window;
	MultiViewController *viewController;
	
	NSString *namePlayer;
	NSString *timeDiffValue;
	NSString *wordsDiffValue;
	NSString *wordsEasyURL;
	NSString *wordsMediumURL;
	NSString *wordsHardURL;
	NSUserDefaults *pref;
	NSString *start;
	NSString *version;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet MultiViewController *viewController;
@property (nonatomic, retain) NSString *namePlayer;
@property (nonatomic, retain) NSString *timeDiffValue;
@property (nonatomic, retain) NSString *wordsDiffValue;
@property (nonatomic, retain) NSUserDefaults *pref;
@property (nonatomic, retain) NSString *wordsEasyURL;
@property (nonatomic, retain) NSString *wordsMediumURL;
@property (nonatomic, retain) NSString *wordsHardURL;
@property (nonatomic, retain) NSString *start;
@property (nonatomic, retain) NSString *version;

-(void) displayView:(int)intNewView;

@end


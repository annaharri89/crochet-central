//
//  CrochetAppDelegate.m
//  Crochet Central
//
//  Created by Anna Harrison on 10/8/12.
//  Copyright (c) 2012 Anna Harrison. All rights reserved.
//

#import "CrochetAppDelegate.h"

NSMutableArray const *userBookmarkArray = nil;
BOOL const *storedBookmarksHaveLoaded = FALSE;

@implementation CrochetAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [self readUserBookmarks];
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(void)readUserBookmarks
{
    //Gets the file and parses it into an array.
    NSString *documentsDirectory = [NSHomeDirectory()
                                    stringByAppendingPathComponent:@"Documents"];
    
    NSString *filePath = [documentsDirectory
                          stringByAppendingPathComponent:@"userBookmarks.txt"];
    NSData *fileContents = [NSData dataWithContentsOfFile:filePath];
    NSString* fileContentsString = [[NSString alloc] initWithBytes:[fileContents bytes]
                                                            length:[fileContents length]
                                                          encoding: NSUTF8StringEncoding];
    
    NSArray *fileContentsArray = [[NSArray alloc] init];
    fileContentsArray = [fileContentsString componentsSeparatedByString:@"<br>"];
    
    NSArray *fileContentsArraySeparated = [[NSArray alloc] init];
    userBookmarkArray = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < [fileContentsArray count]; i++)
    {//keeps empty arrays out of userBookmarkArray and therefore prevents the display of empty cells in bookmark view
        if ([fileContentsArray[i] length] > 0)
        {
            fileContentsArraySeparated = [fileContentsArray[i] componentsSeparatedByString:@"1~sP"];
            [userBookmarkArray addObject:fileContentsArraySeparated];
        }
    }
    storedBookmarksHaveLoaded = TRUE;
}

@end

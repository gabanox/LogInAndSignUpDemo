//
//  AppDelegate.m
//  LogInAndSignUpDemo
//
//  Created by Mattieu Gamache-Asselin on 6/14/12.
//  Copyright (c) 2012 Parse. All rights reserved.
//

#import "AppDelegate.h"
#import "DemoTableViewController.h"

@implementation AppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // ****************************************************************************
    // Fill in with your Parse, Facebook and Twitter credentials:
    // ****************************************************************************
    
    [Parse setApplicationId:@"r48IJBEsMIsRNLOd9hNgcyr9ihGunHpXhA4YOSw1" clientKey:@"jVxJqD3fJ7r5Bx2j9ezxCi8l0hsH5g8RCJrbQPXy"];
    [PFFacebookUtils initializeWithApplicationId:@"227451594050404"];
    [PFTwitterUtils initializeWithConsumerKey:@"your_twitter_consumer_key" consumerSecret:@"your_twitter_consumer_secret"];
    
    
    // Set defualt ACLs
    PFACL *defaultACL = [PFACL ACL];
    [defaultACL setPublicReadAccess:YES];
    [PFACL setDefaultACL:defaultACL withAccessForCurrentUser:YES];
    
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[DemoTableViewController alloc] init]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

// Facebook oauth callback
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [PFFacebookUtils handleOpenURL:url];
} 

@end

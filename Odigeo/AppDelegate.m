//
//  AppDelegate.m
//  Odigeo
//
//  Created by Fernando Canon on 27/11/14.
//  Copyright (c) 2014 Fernando Canon. All rights reserved.
//

#import "AppDelegate.h"
#import "FCPCoreDataStore.h"
#import "WSManager.h"
#import "FCPCoreDataImporter.h"
#import "HomeViewController.h"


@interface AppDelegate ()

@property (nonatomic, strong) WSManager *webServicesManager;
@property (nonatomic, strong) FCPCoreDataImporter *importer;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [FCPCoreDataStore defaultStore];
 
    [self startWebServicesConnection];
    // Override point for customization after application launch.
    UINavigationController *navigationController = (UINavigationController *)self.window.rootViewController;


    HomeViewController *homeViewController =[[HomeViewController alloc] initWithNibName:@"HomeViewController" bundle:nil];
    
    [navigationController pushViewController:homeViewController animated:NO];
    return YES;
}

-(void) startWebServicesConnection{
    
    WSManager *wsManager= [[WSManager alloc] init];
    
    _importer = [[FCPCoreDataImporter alloc] initWithContext:[FCPCoreDataStore privateQueueContext] webservice:wsManager];
    
    [_importer import];

}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
//    [self saveContext];
}


//- (void)saveContext {
//    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
//    if (managedObjectContext != nil) {
//        NSError *error = nil;
//        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
//            // Replace this implementation with code to handle the error appropriately.
//            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
//            abort();
//        }
//    }
//}

@end

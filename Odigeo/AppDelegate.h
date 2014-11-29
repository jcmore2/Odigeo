//
//  AppDelegate.h
//  Odigeo
//
//  Created by Fernando Canon on 27/11/14.
//  Copyright (c) 2014 Fernando Canon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@class FCPCoreDataStore;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) IBOutlet UIWindow *window;
@property (strong, nonatomic) IBOutlet UINavigationController * navigationController;
@property (strong, nonatomic) FCPCoreDataStore *persitentStore;



@end


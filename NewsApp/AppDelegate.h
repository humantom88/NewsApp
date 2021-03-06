//
//  AppDelegate.h
//  NewsApp
//
//  Created by Tom Belov on 16/03/2019.
//  Copyright © 2019 Tom Belov. All rights reserved.

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;

@end


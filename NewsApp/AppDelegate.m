//
//  AppDelegate.m
//  NewsApp
//
//  Created by Tom Belov on 16/03/2019.
//  Copyright © 2019 Tom Belov. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    [self saveContext];
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer
{
    @synchronized (self)
    {
        if (_persistentContainer == nil)
        {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"NewsApp"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil)
                {
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext
{
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error])
    {
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end

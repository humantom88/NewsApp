//
//  NewsFetchingService.h
//  NewsApp
//
//  Created by Tom Belov on 21/03/2019.
//  Copyright © 2019 Tom Belov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface NWSNewsFetchingService : NSObject <NSFetchedResultsControllerDelegate>

+ (NWSNewsFetchingService *)sharedInstance;

- (void)fetchNewsWithCallback:(void (^)(NSDictionary *))callback;

@end

NS_ASSUME_NONNULL_END

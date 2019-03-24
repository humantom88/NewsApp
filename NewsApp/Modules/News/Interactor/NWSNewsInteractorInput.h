//
//  NewsTableInteractorInput.h
//  NewsApp
//
//  Created by Tom Belov on 21/03/2019.
//  Copyright © 2019 Tom Belov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NWSArticle.h"

NS_ASSUME_NONNULL_BEGIN

@protocol NWSNewsInteractorInput <NSObject>

- (void)fetchNewsDataWithCallback:(void (^)(NSArray<NWSArticle *>*))callback;

@end

NS_ASSUME_NONNULL_END

//
//  NewsTableViewOutput.h
//  NewsApp
//
//  Created by Tom Belov on 21/03/2019.
//  Copyright © 2019 Tom Belov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NWSArticle.h"

NS_ASSUME_NONNULL_BEGIN

@protocol NWSNewsTableViewOutput <NSObject>

@property (strong, nonatomic) NSArray<NWSArticle *> *articles;

- (void)loadNewsData;

@end

NS_ASSUME_NONNULL_END

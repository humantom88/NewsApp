//
//  ArticleViewControllerInput.h
//  NewsApp
//
//  Created by Tom Belov on 22/03/2019.
//  Copyright © 2019 Tom Belov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NWSArticle.h"

NS_ASSUME_NONNULL_BEGIN

@protocol NWSArticleViewControllerInput <NSObject>

@property (strong, nonatomic) NWSArticle *article;

@end

NS_ASSUME_NONNULL_END

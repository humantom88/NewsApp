//
//  Article.h
//  NewsApp
//
//  Created by Tom Belov on 22/03/2019.
//  Copyright © 2019 Tom Belov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NWSArticle : NSObject

@property (strong, nonatomic) NSString *author;
@property (strong, nonatomic) NSString *content;
@property (strong, nonatomic) NSString *desc;
@property (strong, nonatomic) NSString *publishedAt;
@property (strong, nonatomic) NSString *source;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *url;
@property (strong, nonatomic) NSString *urlToImage;

@end

NS_ASSUME_NONNULL_END

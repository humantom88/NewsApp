//
//  NewsTableInteractor.m
//  NewsApp
//
//  Created by Tom Belov on 21/03/2019.
//  Copyright © 2019 Tom Belov. All rights reserved.
//

#import "NWSNewsInteractor.h"
#import "NWSNewsFetchingService.h"
#import "NWSArticle.h"

@interface NWSNewsInteractor ()

@end

@implementation NWSNewsInteractor

- (void)fetchNewsDataWithCallback:(void (^)(NSArray<NWSArticle *> *))callback
{
    __weak typeof(self) weakSelf = self;
    
    [[NWSNewsFetchingService sharedInstance] fetchNewsWithCallback:^(NSDictionary *dataDictionary) {
        if (dataDictionary[@"articles"]) {
            NSMutableArray *articles = [NSMutableArray arrayWithArray:@[]];
            for (NSDictionary *articleDict in dataDictionary[@"articles"]) {
                [articles addObject:[weakSelf getArticleFromDictionary:articleDict]];
            }

            callback((NSArray *)articles);
        }
    }];
}

- (NWSArticle *)getArticleFromDictionary:(NSDictionary *)articleDict
{
    NWSArticle *article = [[NWSArticle alloc] init];
    
    article.author = articleDict[@"author"];
    article.source = articleDict[@"source"][@"name"];
    article.content = articleDict[@"content"]; // TODO: erase (\[\+\d+\schars\])
    article.desc = articleDict[@"desc"];
    article.publishedAt = articleDict[@"publishedAt"];
    article.title = articleDict[@"title"];
    article.url = articleDict[@"url"];
    article.urlToImage = articleDict[@"urlToImage"];

    return article;
}

@end

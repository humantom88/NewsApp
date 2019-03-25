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
#import "NWSNewsInteractorUtils.h"

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

- (void)saveIncomingArticles:(NSArray<NWSArticle *> *)articles
{
    // TODO: save incoming articles to DB
    
    return;
}

- (NWSArticle *)getArticleFromDictionary:(NSDictionary *)articleDict
{
    NWSArticle *article = [[NWSArticle alloc] init];
    
    article.author = articleDict[@"author"];
    article.source = articleDict[@"source"][@"name"];
    article.content = [NWSNewsInteractorUtils removeRemainingCharCountFromContent:articleDict[@"content"]];
    article.desc = articleDict[@"desc"];
    article.publishedAt = [NWSNewsInteractorUtils dateFromString:articleDict[@"publishedAt"]];
    article.title = articleDict[@"title"];
    article.url = articleDict[@"url"];
    article.urlToImage = articleDict[@"urlToImage"];

    return article;
}

@end

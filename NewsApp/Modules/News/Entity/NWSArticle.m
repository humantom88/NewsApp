//
//  Article.m
//  NewsApp
//
//  Created by Tom Belov on 22/03/2019.
//  Copyright © 2019 Tom Belov. All rights reserved.
//

#import "NWSArticle.h"

@implementation NWSArticle

- (NSString *)getPublishedAtString
{
    NSDateFormatter *formatter = [NSDateFormatter new];
    
    [formatter setDateStyle:NSDateFormatterShortStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    return [formatter stringFromDate:_publishedAt];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@: %@", _publishedAt, _title];
}

@end

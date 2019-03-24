//
//  NWSNewsInteractorUtils.m
//  NewsApp
//
//  Created by Tom Belov on 24/03/2019.
//  Copyright © 2019 Tom Belov. All rights reserved.
//

#import "NWSNewsInteractorUtils.h"

@implementation NWSNewsInteractorUtils

+ (NSString *)removeRemainingCharCountFromContent:(NSString *)content
{
    if ([content isEqual:[NSNull null]] || [content length] == 0) {
        NSLog(@"Error: empty content passed to removeRemainingCharCountFromContent.");
        return nil;
    }
    
    NSError *error = nil;
    
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"(\\[\\+\\d+\\schars)\\]" options:NSRegularExpressionCaseInsensitive error:&error];
    
    if (error) {
        NSLog(@"Error: %@", error);
        return nil;
    }
    
    NSString *modifiedString = [regex stringByReplacingMatchesInString:content options:0 range:NSMakeRange(0, [content length]) withTemplate:@""];
    
    return modifiedString;
}


@end

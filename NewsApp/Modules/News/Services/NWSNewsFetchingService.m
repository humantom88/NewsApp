//
//  NewsFetchingService.m
//  NewsApp
//
//  Created by Tom Belov on 21/03/2019.
//  Copyright © 2019 Tom Belov. All rights reserved.
//

#import "NWSNewsFetchingService.h"

@implementation NWSNewsFetchingService

+ (NWSNewsFetchingService *)sharedInstance
{
    static dispatch_once_t token = 0;
    static NWSNewsFetchingService *sharedInstance = nil;
    
    dispatch_once(&token, ^(void){
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}


- (void)fetchNewsWithCallback:(void (^)(NSDictionary *))callback
{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    
    [request setHTTPMethod:@"GET"];
    [request setURL:[NSURL URLWithString:[self buildNewsURL]]];
    
    [self sendHTTPRequest:request withCallback:^(NSData *data) {
        callback([self parseDictionaryFromData:data]);
    }];
    
    return;
}

- (NSDictionary *)parseDictionaryFromData:(NSData *)data {
    NSError *error = nil;
    
    NSDictionary *results = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    
    if(error) {
        NSLog(@"Error: unable to serialize incoming data: %@", error);
        return nil;
    }
    
    return results;
}

- (void)sendHTTPRequest:(NSMutableURLRequest *)request withCallback:(void(^)(NSData *))callback
{
    // NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    [[[NSURLSession sharedSession]
      dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
          NSInteger statusCode = [(NSHTTPURLResponse *)response statusCode];
          if (statusCode != 200) {
              NSLog(@"Error getting %@, HTTP status code %li", request.URL, statusCode);
              return;
          }
          //[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]
          callback(data);
      }] resume];
}

- (NSString *)buildNewsURL
{
    // TODO: organize URL building
    //return @"http://localhost";

    // Doesn't work yet, need to configure plist security settings
    return @"https://newsapi.org/v2/top-headlines?country=us&apiKey=1f369406c2194047bcb6fdeba23e2414";
}

@end

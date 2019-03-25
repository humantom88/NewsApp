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

- (NSDictionary *)parseDictionaryFromData:(NSData *)data
{
    NSError *error = nil;
    
    NSDictionary *results = [NSJSONSerialization JSONObjectWithData:data
                                                            options:NSJSONReadingAllowFragments
                                                              error:&error];
    
    if(error) {
        NSLog(@"Error: unable to serialize incoming data: %@", error);
        return nil;
    }
    
    return results;
}

- (void)sendHTTPRequest:(NSMutableURLRequest *)request withCallback:(void(^)(NSData *))callback
{
    [[[NSURLSession sharedSession] dataTaskWithRequest:request
                                     completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                         
                                                          NSInteger statusCode = [(NSHTTPURLResponse *)response statusCode];
                                         
                                                          if (statusCode != 200) {
                                                              NSLog(@"Error getting %@, HTTP status code %li", request.URL, statusCode);
                                                              return;
                                                          }
                                                          
                                                          callback(data);
                                                      }
      ] resume];
}

- (NSString *)buildNewsURL
{
    // TODO: organize URL building
    
    // For bank network
    return @"http://localhost";

    // Doesnt'w work in bank network
//    NSDictionary* info = [[NSBundle mainBundle] infoDictionary];
//    NSString *apiKey = [info objectForKey:@"NWSNewsApiKey"];
//    NSString *country = [info objectForKey:@"NWSNewsCountry"];
//
//    return [NSString stringWithFormat:@"https://newsapi.org/v2/top-headlines?country=%@&apiKey=%@", country, apiKey];
}

@end

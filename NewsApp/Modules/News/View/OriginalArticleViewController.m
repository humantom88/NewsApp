//
//  OriginalArticleViewController.m
//  NewsApp
//
//  Created by Tom Belov on 22/03/2019.
//  Copyright © 2019 Tom Belov. All rights reserved.
//

#import <WebKit/WebKit.h>
#import "OriginalArticleViewController.h"

@interface OriginalArticleViewController ()

@property (weak, nonatomic) IBOutlet WKWebView *webPageView;

@end

@implementation OriginalArticleViewController

//override func loadView() {
//    let webConfiguration = WKWebViewConfiguration()
//    webView = WKWebView(frame: .zero, configuration: webConfiguration)
//    webView.uiDelegate = self
//    view = webView
//}

- (void)viewDidLoad {
    [super viewDidLoad];

    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    
    [request setHTTPMethod:@"GET"];
    [request setURL:[NSURL URLWithString:[self articleUrlString]]];
    
    //[self.webPageView load:request];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

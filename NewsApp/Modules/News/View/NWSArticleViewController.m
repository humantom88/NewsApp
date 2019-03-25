//
//  ArticleViewController.m
//  NewsApp
//
//  Created by Tom Belov on 22/03/2019.
//  Copyright © 2019 Tom Belov. All rights reserved.
//

#import "NWSArticleViewController.h"
#import "NWSArticle.h"

@interface NWSArticleViewController ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *publishedAtLabel;
@property (weak, nonatomic) IBOutlet UITextView *contentTextView;

@end

@implementation NWSArticleViewController

@synthesize article;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.titleLabel.text = self.article.title;
    self.contentTextView.text = self.article.content;
    self.publishedAtLabel.text = [self.article getPublishedAtString];
}

@end

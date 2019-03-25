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

@synthesize article = _article;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.titleLabel.text = _article.title;
    self.contentTextView.text = _article.content;
    self.publishedAtLabel.text = [_article getPublishedAtString];
}

@end

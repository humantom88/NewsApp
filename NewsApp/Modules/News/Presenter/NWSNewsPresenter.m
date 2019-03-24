//
//  NewsPresenter.m
//  NewsApp
//
//  Created by Tom Belov on 21/03/2019.
//  Copyright © 2019 Tom Belov. All rights reserved.
//

#import "NWSNewsPresenter.h"
#import "NWSNewsTableViewInput.h"
#import "NWSNewsInteractorInput.h"
#import "NWSNewsInteractor.h"

@interface NWSNewsPresenter()

@end

@implementation NWSNewsPresenter

- (void)loadNewsData
{
    __weak typeof(self) weakSelf = self;
    
    [self.interactor fetchNewsDataWithCallback:^(NSArray<NWSArticle *> *articles) {
        weakSelf.articles = articles;
        [weakSelf displayNews];
    }];

    return;
}

- (void)displayNews
{
    [_view displayNews];
}

@synthesize articles;

@end

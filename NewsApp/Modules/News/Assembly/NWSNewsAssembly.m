//
//  NewsAssembly.m
//  NewsApp
//
//  Created by Tom Belov on 24/03/2019.
//  Copyright © 2019 Tom Belov. All rights reserved.
//

#import "NWSNewsAssembly.h"

#import "NWSArticle.h"
#import "NWSNewsInteractor.h"
#import "NWSNewsPresenter.h"
#import "NWSNewsTableViewController.h"

@implementation NWSNewsAssembly

- (NWSNewsTableViewController *)newsTableViewController
{
    return [TyphoonDefinition withClass:[NWSNewsTableViewController class]
                          configuration:^(TyphoonDefinition *definition)
                                        {
                                            [definition injectProperty:@selector(output)
                                                                  with:[self newsPresenter]];
                                        }];
}

- (NWSNewsInteractor *)newsInteractor
{
    return [TyphoonDefinition withClass:[NWSNewsInteractor class]
                          configuration:^(TyphoonDefinition *definition)
                                        {
                                            [definition injectProperty:@selector(output)
                                                                  with:[self newsPresenter]];
                                        }];
}

- (NWSNewsPresenter *)newsPresenter
{
    return [TyphoonDefinition withClass:[NWSNewsPresenter class]
                          configuration:^(TyphoonDefinition *definition)
                                        {
                                            [definition injectProperty:@selector(view)
                                                                  with:[self newsTableViewController]];
                                            [definition injectProperty:@selector(interactor)
                                                                  with:[self newsInteractor]];
                                        }];
}

@end

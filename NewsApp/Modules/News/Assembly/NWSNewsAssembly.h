//
//  NewsAssembly.h
//  NewsApp
//
//  Created by Tom Belov on 24/03/2019.
//  Copyright © 2019 Tom Belov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Typhoon.h"

@class NWSNewsInteractor;
@class NWSNewsPresenter;
@class NWSNewsTableViewController;

NS_ASSUME_NONNULL_BEGIN

@interface NWSNewsAssembly : TyphoonAssembly

- (NWSNewsTableViewController *)newsTableViewController;
- (NWSNewsPresenter *)newsPresenter;
- (NWSNewsInteractor *)newsInteractor;


@end

NS_ASSUME_NONNULL_END

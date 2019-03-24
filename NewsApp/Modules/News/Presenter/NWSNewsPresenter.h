//
//  NewsPresenter.h
//  NewsApp
//
//  Created by Tom Belov on 21/03/2019.
//  Copyright © 2019 Tom Belov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NWSNewsTableViewInput.h"
#import "NWSNewsTableViewOutput.h"
#import "NWSNewsInteractorOutput.h"
#import "NWSNewsInteractorInput.h"

NS_ASSUME_NONNULL_BEGIN

@interface NWSNewsPresenter : NSObject <NWSNewsTableViewOutput, NWSNewsInteractorOutput>

// - (instancetype)initWithView:(__nullable id<NWSNewsTableViewInput>)view;
// - (instancetype)initWithView:(id<NWSNewsTableViewInput>)view andInteractor:(id<NWSNewsInteractorInput>)interactor;

@property (weak, nonatomic) id<NWSNewsTableViewInput> view;
@property (strong, nonatomic) id<NWSNewsInteractorInput> interactor;

@end

NS_ASSUME_NONNULL_END

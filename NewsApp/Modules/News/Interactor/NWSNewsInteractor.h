//
//  NewsTableInteractor.h
//  NewsApp
//
//  Created by Tom Belov on 21/03/2019.
//  Copyright © 2019 Tom Belov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NWSNewsInteractorInput.h"
#import "NWSNewsInteractorOutput.h"

NS_ASSUME_NONNULL_BEGIN

@interface NWSNewsInteractor : NSObject <NWSNewsInteractorInput>

@property (weak, nonatomic) id<NWSNewsInteractorOutput>output;

@end

NS_ASSUME_NONNULL_END

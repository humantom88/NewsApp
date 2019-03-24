//
//  NWSApplicationAssembly.h
//  NewsApp
//
//  Created by Tom Belov on 24/03/2019.
//  Copyright © 2019 Tom Belov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TyphoonAssembly.h"
NS_ASSUME_NONNULL_BEGIN

@class NWSNewsAssembly;

@interface NWSApplicationAssembly : TyphoonAssembly

@property(nonatomic, strong, readonly) NWSNewsAssembly *newsAssembly;

@end

NS_ASSUME_NONNULL_END

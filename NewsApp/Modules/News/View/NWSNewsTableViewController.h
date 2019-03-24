//
//  NewsTableViewController.h
//  NewsApp
//
//  Created by Tom Belov on 21/03/2019.
//  Copyright © 2019 Tom Belov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NWSNewsTableViewInput.h"
#import "NWSNewsTableViewOutput.h"

NS_ASSUME_NONNULL_BEGIN

@interface NWSNewsTableViewController : UITableViewController <NWSNewsTableViewInput>

@property (strong, nonatomic) id<NWSNewsTableViewOutput> output;
// - (instancetype)initWithPresenter:(id<NWSNewsTableViewOutput>)presenter;

@end

NS_ASSUME_NONNULL_END

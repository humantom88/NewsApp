//
//  NewsTableViewCell.h
//  NewsApp
//
//  Created by Tom Belov on 21/03/2019.
//  Copyright © 2019 Tom Belov. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NWSArticle;

NS_ASSUME_NONNULL_BEGIN

@interface NWSNewsTableViewCell : UITableViewCell

@property (strong, nonatomic) NWSArticle *localArticle;

@property (weak, nonatomic) IBOutlet UILabel *sourceLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

- (void) setInternalFields:(NWSArticle *)incomingArticle;

@end

NS_ASSUME_NONNULL_END

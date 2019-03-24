//
//  NewsTableViewCell.m
//  NewsApp
//
//  Created by Tom Belov on 21/03/2019.
//  Copyright © 2019 Tom Belov. All rights reserved.
//

#import "NWSNewsTableViewCell.h"
#import "NWSArticle.h"

@implementation NWSNewsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void) setInternalFields:(NWSArticle *)incomingArticle
{
    self.localArticle = incomingArticle;
    
    self.titleLabel.text = incomingArticle.title;
    self.sourceLabel.text = incomingArticle.source;
}

@end

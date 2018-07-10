//
//  PostTableViewCell.m
//  Instagram
//
//  Created by Ginger Dudley on 7/10/18.
//  Copyright © 2018 Ginger Dudley. All rights reserved.
//

#import "PostTableViewCell.h"

@implementation PostTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setPost:(Post *)post{
    _post = post;
    self.postImage.file = post.image;
    self.captionLabel.text = post.caption;
    [self.captionLabel sizeToFit];
    [self.postImage loadInBackground];
    
}

@end

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
    
    //self.user = post.author;
    self.usernameTopLabel.text = post.author.username;
    self.usernameBottomLabel.text = post.author.username;
    
    self.likeCountLabel.text = [[NSString stringWithFormat:@"%@", post.likeCount] stringByAppendingString:@" likes"];
    self.createdAtLabel.text = [NSString stringWithFormat:@"%@", post.createdAt];
    
    [self.usernameBottomLabel sizeToFit];
    [self.usernameTopLabel sizeToFit];
    [self.likeCountLabel sizeToFit];
    [self.captionLabel sizeToFit];
    [self.postImage loadInBackground];
    
    
}

@end

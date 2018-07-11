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
- (IBAction)didTapLike:(id)sender {
    if (self.post.liked) {
        [self.post decrementLike];
        self.post.liked = NO;
    }
    else{
        [self.post incrementLike];
        self.post.liked = YES;
    }
   
    //self.likeButton.imageView =
    [self refreshData];
}

-(void)refreshData{
    self.likeCountLabel.text = [[NSString stringWithFormat:@"%@", self.post.likeCount] stringByAppendingString:@" likes"];
    
    if (self.post.liked) {
        UIImage *likeButtonImage = [UIImage imageNamed:@"filledheart"];
        [self.likeButton setImage:likeButtonImage forState:UIControlStateNormal];
    }
    else{
        UIImage *likeButtonImage = [UIImage imageNamed:@"emptyheart"];
        [self.likeButton setImage:likeButtonImage forState:UIControlStateNormal];
    }
    
    //[self.favoriteButton setImage:favoriteButtonImage forState:UIControlStateNormal];
    
}


@end

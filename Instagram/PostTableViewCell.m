//
//  PostTableViewCell.m
//  Instagram
//
//  Created by Ginger Dudley on 7/10/18.
//  Copyright © 2018 Ginger Dudley. All rights reserved.
//

#import "PostTableViewCell.h"
#import "NSDate+TimeAgo.h"


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
    
    NSString *ago = [post.createdAt timeAgo];
    //newPost.createdAt = ago;
    self.createdAtLabel.text = [NSString stringWithFormat:@"%@", ago];
    self.profileImageView.layer.cornerRadius = self.profileImageView.frame.size.width / 2;
    self.profileImageView.clipsToBounds = YES;
    self.profileImageView.layer.borderWidth = 3.0f;
    self.profileImageView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    //checking to see profile image if it loads
    PFFile *holderFile = [PFUser currentUser][@"profilePicture"];
    //PFFile *holderFile = self.user.profilePicture;
    //PFFile *holderFile = self.user.profilePicture;
    //PFFile *holderFiler = self.post.author
    //self.profileImageView. = holderFile
    [holderFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
        if (!data) {
            return NSLog(@"%@", error);
        }
        self.profileImageView.image = [UIImage imageWithData:data];
    }];
    //self.profileImageView = [PFUser currentUser][@"profilePicture"];
    //NSLog(@"%@", [PFUser currentUser][@"profilePicture"]);
    
    [self.usernameBottomLabel sizeToFit];
    [self.usernameTopLabel sizeToFit];
    [self.likeCountLabel sizeToFit];
    [self.captionLabel sizeToFit];
    [self.postImage loadInBackground];
    [self.profileImageView loadInBackground];
    
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

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
     UITapGestureRecognizer *profileTapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(didTapUserProfile:)];
    [self.profileImageView addGestureRecognizer:profileTapGestureRecognizer];
    [self.profileImageView setUserInteractionEnabled:YES];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//-(void)setUser:(User *)user{
//    _user = user;
//
//}
//-(void)setUser:(User *)user{
//    _user = user;
//    self.user = [PFUser currentUser];
//    PFFile *holderFile = self.user.profilePicture;
//    [holderFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
//        if (!data) {
//            return NSLog(@"%@", error);
//        }
//        self.profileImageView.image = [UIImage imageWithData:data];
//    }];
//}

- (void)setPost:(Post *)post{
    _post = post;
    self.postImage.file = post.image;
    self.captionLabel.text = post.caption;
    
    self.usernameTopLabel.text = post.author.username;
    self.usernameBottomLabel.text = post.author.username;
    
    self.likeCountLabel.text = [[NSString stringWithFormat:@"%@", post.likeCount] stringByAppendingString:@" likes"];
    
    NSString *ago = [post.createdAt timeAgo];
    self.createdAtLabel.text = [NSString stringWithFormat:@"%@", ago];
    self.profileImageView.layer.cornerRadius = self.profileImageView.frame.size.width / 2;
    self.profileImageView.clipsToBounds = YES;
    self.profileImageView.layer.borderWidth = 3.0f;
    self.profileImageView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    PFFile *holderFile = self.post.author.profilePicture;
    [holderFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
        if (!data) {
            return NSLog(@"%@", error);
        }
        self.profileImageView.image = [UIImage imageWithData:data];
    }];
    
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
    
}

//adding a segue to a details page from the storyboard
- (void) didTapUserProfile:(UITapGestureRecognizer *)sender{
    // TODO: Call method on delegate
    //is this the right syntax??? passing the author of the post (user object) to the new view controller
    //what do they send here, aka what did they tap to send??
    //[self.delegate postCell:self didTap:self.user.username];
    //[self.delegate postCell:self didTap:self.user];
    
    [self.delegate postCell:self didTap:self.post];
}


@end

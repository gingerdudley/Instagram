//
//  ProfilePostCell.m
//  Instagram
//
//  Created by Ginger Dudley on 7/10/18.
//  Copyright © 2018 Ginger Dudley. All rights reserved.
//

#import "ProfilePostCell.h"
//#import "Post.h"

@implementation ProfilePostCell

- (void)setPost:(Post *)post{
    _post = post;
    //setting the poster image 
    self.postImage.file = post.image;
    //self.captionLabel.text = post.caption;
    
    //self.user = post.author;
//    self.usernameTopLabel.text = post.author.username;
//    self.usernameBottomLabel.text = post.author.username;
//
//    self.likeCountLabel.text = [[NSString stringWithFormat:@"%@", post.likeCount] stringByAppendingString:@" likes"];
//    self.createdAtLabel.text = [NSString stringWithFormat:@"%@", post.createdAt];
//
//    [self.usernameBottomLabel sizeToFit];
//    [self.usernameTopLabel sizeToFit];
//    [self.likeCountLabel sizeToFit];
//    [self.captionLabel sizeToFit];
    [self.postImage loadInBackground];
    
    
}

@end

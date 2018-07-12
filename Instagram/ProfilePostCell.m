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
    self.postImage.file = post.image;
    [self.postImage loadInBackground];
    
    
}

@end

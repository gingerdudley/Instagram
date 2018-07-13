//
//  timelineProfileCell.m
//  Instagram
//
//  Created by Ginger Dudley on 7/13/18.
//  Copyright © 2018 Ginger Dudley. All rights reserved.
//

#import "timelineProfileCell.h"

@implementation timelineProfileCell

-(void)setPost:(Post *)post{
    _post = post;
    self.postImage.file = post.image;
    [self.postImage loadInBackground];
}

@end

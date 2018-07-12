//
//  Post.m
//  Instagram
//
//  Created by Ginger Dudley on 7/9/18.
//  Copyright © 2018 Ginger Dudley. All rights reserved.
//

#import "Post.h"
#import "Parse/Parse.h"
//#import "NSDate+TimeAgo.h"

@implementation Post

@dynamic postID;
@dynamic userID;
@dynamic author;
@dynamic caption;
@dynamic image;
@dynamic likeCount;
@dynamic commentCount;
@dynamic createdAt;
@dynamic liked;

+ (nonnull NSString *)parseClassName {
    return @"Post";
}

+ (void) postUserImage: ( UIImage * _Nullable )image withCaption: ( NSString * _Nullable )caption withCompletion: (PFBooleanResultBlock  _Nullable)completion {
    
    Post *newPost = [Post new];
    //not working with the PFObject
    newPost.image = [self getPFFileFromImage:image];
    newPost.author = [PFUser currentUser];
    newPost.caption = caption;
    newPost.likeCount = @(0);
    newPost.commentCount = @(0);
    
    //changing formatting of date:
    //NSString *ago = [newPost.createdAt timeAgo];
    //newPost.createdAt = ago;
    
    
    //adding bool for liked aspect
    newPost.liked = NO;

//    NSString *createdAtOriginalString = createdAt;
//    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    

    [newPost saveInBackgroundWithBlock: completion];

}

+ (PFFile *)getPFFileFromImage: (UIImage * _Nullable)image {
    
    // check if image is not nil
    if (!image) {
        return nil;
    }
    NSData *imageData = UIImagePNGRepresentation(image);
    // get image data and check if that is not nil
    if (!imageData) {
        return nil;
    }
    
    return [PFFile fileWithName:@"image.png" data:imageData];
}

-(void) incrementLike{
    //self.likeCount += 1;
    self.likeCount = [NSNumber numberWithLong:[self.likeCount integerValue] +1 ];
    [self saveInBackground];
    //intValue +1;

}

-(void) decrementLike{
    self.likeCount = [NSNumber numberWithLong:[self.likeCount integerValue] -1];
    [self saveInBackground];
}



@end

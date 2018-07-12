//
//  Post.h
//  Instagram
//
//  Created by Ginger Dudley on 7/9/18.
//  Copyright © 2018 Ginger Dudley. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Parse/Parse.h"
#import "User.h"

@interface Post : PFObject<PFSubclassing>

@property (nonatomic, strong) NSString *postID;
@property (nonatomic, strong) NSString *userID;
@property (nonatomic, strong) User *author;

@property (nonatomic, strong) NSString *caption;
@property (nonatomic, strong) PFFile *image;
@property (nonatomic, strong) NSNumber *likeCount;
@property (nonatomic, strong) NSNumber *commentCount;

//adding a created at property
//@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, strong) NSDate *createdAt;
@property (nonatomic) BOOL liked;
//@property

+ (void) postUserImage: ( UIImage * _Nullable )image withCaption: ( NSString * _Nullable )caption withCompletion: (PFBooleanResultBlock  _Nullable)completion;

//adding get pfffile from image
+ (PFFile *)getPFFileFromImage: (UIImage * _Nullable)image;

-(void) incrementLike;
-(void) decrementLike;

@end

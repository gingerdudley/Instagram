//
//  PostTableViewCell.h
//  Instagram
//
//  Created by Ginger Dudley on 7/10/18.
//  Copyright © 2018 Ginger Dudley. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"
#import "ParseUI/ParseUI.h"
#import "Parse.h"
#import "User.h"

//adding for tap gesture
@protocol ProfileTabelViewCellDelegate;

@interface PostTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet PFImageView *postImage;
@property (weak, nonatomic) IBOutlet UILabel *captionLabel;

@property (weak, nonatomic) IBOutlet PFImageView *profileImageView;
//@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UILabel *usernameTopLabel;
@property (weak, nonatomic) IBOutlet UILabel *createdAtLabel;
@property (weak, nonatomic) IBOutlet UILabel *likeCountLabel;
@property (weak, nonatomic) IBOutlet UIButton *likeButton;
@property (weak, nonatomic) IBOutlet UILabel *usernameBottomLabel;

//@property (nonatomic, strong) PFUser *user;

@property (nonatomic, strong) Post *post;
@property (nonatomic, strong) User *user;

//optional property for the delegate
@property (nonatomic, weak) id<ProfileTabelViewCellDelegate> delegate;


@end

//adding a segue and tap gesture from users profile pic
@protocol ProfileTabelViewCellDelegate

//-(void)postCell:(PostTableViewCell *) postCell didTap: (User *)user;
-(void)postCell:(PostTableViewCell *) postCell didTap: (Post *)post;

@end


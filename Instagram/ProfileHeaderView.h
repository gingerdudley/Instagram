//
//  ProfileHeaderView.h
//  Instagram
//
//  Created by Ginger Dudley on 7/11/18.
//  Copyright © 2018 Ginger Dudley. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"
#import "Parse.h"
#import "ParseUI/ParseUI.h"

@interface ProfileHeaderView : UICollectionReusableView

//@property (weak, nonatomic) IBOutlet UILabel *testerLabel;
@property (weak, nonatomic) IBOutlet UILabel *postNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet PFImageView *profilePictureImageView;
//@property (weak, nonatomic) IBOutlet UIImageview *profilePictureImageView;

@end

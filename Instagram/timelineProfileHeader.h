//
//  timelineProfileHeader.h
//  Instagram
//
//  Created by Ginger Dudley on 7/13/18.
//  Copyright © 2018 Ginger Dudley. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"
#import "Parse.h"
#import "ParseUI/ParseUI.h"

@interface timelineProfileHeader : UICollectionReusableView

@property (weak, nonatomic) IBOutlet UILabel *postNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet PFImageView *profilePictureImageView;

@end

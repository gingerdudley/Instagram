//
//  ProfilePostCell.h
//  Instagram
//
//  Created by Ginger Dudley on 7/10/18.
//  Copyright © 2018 Ginger Dudley. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"
#import "Parse.h"
#import "ParseUI/ParseUI.h"

@interface ProfilePostCell : UICollectionViewCell

//@property (weak, nonatomic) IBOutlet UIImageView *postImage;

@property (weak, nonatomic) Post *post;
@property (weak, nonatomic) IBOutlet PFImageView *postImage;

@end

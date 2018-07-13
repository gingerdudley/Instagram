//
//  timelineProfileCell.h
//  Instagram
//
//  Created by Ginger Dudley on 7/13/18.
//  Copyright © 2018 Ginger Dudley. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ParseUI/ParseUI.h"
#import "Parse.h"
#import "Post.h"

@interface timelineProfileCell : UICollectionViewCell

@property (weak, nonatomic) Post *post;
@property (weak, nonatomic) IBOutlet PFImageView *postImage;


@end

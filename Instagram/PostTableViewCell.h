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


@interface PostTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet PFImageView *postImage;
@property (weak, nonatomic) IBOutlet UILabel *captionLabel;

@property (nonatomic, strong) Post *post;


@end

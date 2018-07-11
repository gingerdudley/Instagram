//
//  DetailsViewController.h
//  Instagram
//
//  Created by Ginger Dudley on 7/11/18.
//  Copyright © 2018 Ginger Dudley. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"
#import "ParseUI/ParseUI.h"

@interface DetailsViewController : UIViewController

@property (nonatomic, strong) Post *post;

@property (weak, nonatomic) IBOutlet PFImageView *postImageView;
@property (weak, nonatomic) IBOutlet UILabel *topUsernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *bottomUsernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *captionLabel;
@property (weak, nonatomic) IBOutlet UILabel *likesLabel;
@property (weak, nonatomic) IBOutlet UIImageView *profilePicImage;


@end

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

@interface ProfileHeaderView : UICollectionReusableView

//@property (weak, nonatomic) IBOutlet UILabel *testerLabel;
@property (weak, nonatomic) IBOutlet UILabel *postNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;

@end

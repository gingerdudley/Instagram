//
//  timelineProfileGridViewController.h
//  Instagram
//
//  Created by Ginger Dudley on 7/13/18.
//  Copyright © 2018 Ginger Dudley. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"
#import "User.h"

@interface timelineProfileGridViewController : UIViewController

@property Post *post;

@property (strong, nonatomic) User *user;

@end

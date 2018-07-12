//
//  ProfileGridViewController.h
//  Instagram
//
//  Created by Ginger Dudley on 7/10/18.
//  Copyright © 2018 Ginger Dudley. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"
#import "User.h"

//@interface ProfileGridViewController : UIViewController
//adding image picker for profile picture
@interface ProfileGridViewController : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property Post *post;

@property User *user;

@end

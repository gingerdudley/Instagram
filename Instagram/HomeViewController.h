//
//  HomeViewController.h
//  Instagram
//
//  Created by Ginger Dudley on 7/9/18.
//  Copyright © 2018 Ginger Dudley. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PostTableViewCell.h"

//@interface HomeViewController : UIViewController<UITableViewDataSource>
//@interface HomeViewController : UIViewController
@interface HomeViewController : UIViewController<ProfileTabelViewCellDelegate>

@end

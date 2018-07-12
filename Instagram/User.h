//
//  User.h
//  Instagram
//
//  Created by Ginger Dudley on 7/12/18.
//  Copyright © 2018 Ginger Dudley. All rights reserved.
//

#import "PFUser.h"
#import "Parse/Parse.h"

@interface User : PFUser <PFSubclassing>

@property PFFile *profilePicture;

@end

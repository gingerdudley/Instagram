//
//  DetailsViewController.m
//  Instagram
//
//  Created by Ginger Dudley on 7/11/18.
//  Copyright © 2018 Ginger Dudley. All rights reserved.
//

#import "DetailsViewController.h"
#import "Parse.h"

@interface DetailsViewController ()


@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.postImageView.file = self.post.image;
    self.topUsernameLabel.text = self.post.author.username;
    [self.topUsernameLabel sizeToFit];
    self.bottomUsernameLabel.text = self.post.author.username;
    [self.bottomUsernameLabel sizeToFit];
    self.captionLabel.text = self.post.caption;
    self.likesLabel.text = [[NSString stringWithFormat:@"%@", self.post.likeCount] stringByAppendingString:@" likes"];
    self.profilePicImage.layer.cornerRadius = self.profilePicImage.frame.size.width / 2;
    self.profilePicImage.clipsToBounds = YES;
    self.profilePicImage.layer.borderWidth = 3.0f;
    self.profilePicImage.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    PFFile *holderFile = self.post.author.profilePicture;
    [holderFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
        if (!data) {
            return NSLog(@"%@", error);
        }
        self.profilePicImage.image = [UIImage imageWithData:data];
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didTapLike:(id)sender {
    if (self.post.liked) {
        [self.post decrementLike];
        self.post.liked = NO;
    }
    else{
        [self.post incrementLike];
        self.post.liked = YES;
    }
    [self refreshData];
    
}

-(void)refreshData{
    self.likesLabel.text = [[NSString stringWithFormat:@"%@", self.post.likeCount] stringByAppendingString:@" likes"];
    
    if (self.post.liked) {
        UIImage *likeButtonImage = [UIImage imageNamed:@"filledheart"];
        [self.likeButton setImage:likeButtonImage forState:UIControlStateNormal];
    }
    else{
        UIImage *likeButtonImage = [UIImage imageNamed:@"emptyheart"];
        [self.likeButton setImage:likeButtonImage forState:UIControlStateNormal];
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

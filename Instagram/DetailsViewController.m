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

//trying to send a post to the details view controller
//@property (nonatomic, strong) Post *post;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //self.postImageView = [self.post getPFFileFromImage:image];
    self.postImageView.file = self.post.image;
    self.topUsernameLabel.text = self.post.author.username;
    self.bottomUsernameLabel.text = self.post.author.username;
    self.captionLabel.text = self.post.caption;
    self.likesLabel.text = [[NSString stringWithFormat:@"%@", self.post.likeCount] stringByAppendingString:@" likes"];
    self.profilePicImage.layer.cornerRadius = self.profilePicImage.frame.size.width / 2;
    self.profilePicImage.clipsToBounds = YES;
    self.profilePicImage.layer.borderWidth = 3.0f;
    self.profilePicImage.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

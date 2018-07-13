//
//  timelineProfileGridViewController.m
//  Instagram
//
//  Created by Ginger Dudley on 7/13/18.
//  Copyright © 2018 Ginger Dudley. All rights reserved.
//

#import "timelineProfileGridViewController.h"
#include "Parse.h"
#include "timelineProfileCell.h"
#include "timelineProfileHeader.h"
#include "ParseUI/ParseUI.h"

@interface timelineProfileGridViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (strong, nonatomic) NSArray *posts;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation timelineProfileGridViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    //[self fetchPosts];
    //[self fetchUsers];
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
    CGFloat postersPerline = 3;
    
    CGFloat itemWidth = self.collectionView.frame.size.width / postersPerline;
    //CGFloat itemHeight = itemWidth * 1.5;
    CGFloat itemHeight = itemWidth * 1.25;
    layout.itemSize = CGSizeMake( itemWidth, itemHeight);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)fetchPosts{
    PFQuery *query = [Post query];
    //trying to sort posts based on the sender
    [query whereKey:@"author" equalTo: self.user.username];
    [query orderByDescending:@"createdAt"];
    [query includeKey:@"author"];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *posts, NSError *error) {
        if (posts != nil) {
            self.posts = posts;
        } else {
            NSLog(@"%@", error.localizedDescription);
        }
        [self.collectionView reloadData];
    }];
}
//-(void)fetchUsers{
//    PFQuery *query = [User query];
//    [query whereKey:@"username" equalTo:self.user.username];
//    [query includeKey:@"profilePicture"];
//
//    [query findObjectsInBackgroundWithBlock:^(NSArray *users, NSError *error) {
//        if (users != nil) {
//            self.user = [users firstObject];
//        } else {
//            NSLog(@"%@", error.localizedDescription);
//        }
//        [self.collectionView reloadData];
//    }];
//
//}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.posts.count;
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    timelineProfileCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"timelineProfileCell" forIndexPath:indexPath];
    cell.post = self.posts[indexPath.item];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    timelineProfileHeader *header = nil;
    if( kind == UICollectionElementKindSectionHeader){
        header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"timelineProfileHeader" forIndexPath:indexPath];
        
        header.postNumberLabel.text = [[NSString stringWithFormat:@"%lu", self.posts.count] stringByAppendingString:@" posts"];
        header.usernameLabel.text = [PFUser currentUser].username;
        header.profilePictureImageView.layer.cornerRadius = header.profilePictureImageView.frame.size.width / 2;
        header.profilePictureImageView.clipsToBounds = YES;
        header.profilePictureImageView.layer.borderWidth = 3.0f;
        header.profilePictureImageView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        
        header.profilePictureImageView.file = self.user.profilePicture;
        [header.profilePictureImageView loadInBackground];
        
        
    }
    return header;
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

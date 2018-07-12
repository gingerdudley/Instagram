//
//  ProfileGridViewController.m
//  Instagram
//
//  Created by Ginger Dudley on 7/10/18.
//  Copyright © 2018 Ginger Dudley. All rights reserved.
//

#import "ProfileGridViewController.h"
#include "Parse.h"
#include "ProfilePostCell.h"
#import "ProfileHeaderView.h"
#import "DetailsViewController.h"
#import "Post.h"
#import "ParseUI/ParseUI.h"
#import "User.h"

@interface ProfileGridViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (strong, nonatomic) NSArray *posts;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

//adding user array
//@property (strong, nonatomic) User *user;


//adding a profile picture

//@property (strong, nonatomic) UIImage *savedImage;
@property (strong, nonatomic) PFFile *savedImage;
//@property (weak, nonatomic) IBOutlet PFImageView *profilePicture;



@end

@implementation ProfileGridViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [self fetchPosts];
    [self fetchUser];
    
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
    PFQuery *query = [PFQuery queryWithClassName:@"Post"];
    [query whereKey:@"author" equalTo:[PFUser currentUser]];
    //query.limit = 20;

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

-(void)fetchUser{
    PFQuery *query = [User query];
    [query whereKey:@"username" equalTo:[PFUser currentUser].username];
    [query includeKey:@"profilePicture"];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *users, NSError *error) {
        if (users != nil) {
            self.user = [users firstObject];
        } else {
            NSLog(@"%@", error.localizedDescription);
        }
        [self.collectionView reloadData];
    }];
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.posts.count;
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    ProfilePostCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ProfilePostCell" forIndexPath:indexPath];
    cell.post = self.posts[indexPath.item];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    ProfileHeaderView *header = nil;
    if( kind == UICollectionElementKindSectionHeader){
        header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"ProfileHeaderView" forIndexPath:indexPath];
        
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

- (IBAction)didTapEdit:(id)sender {
    UIImagePickerController *imagePickerVC = [UIImagePickerController new];
    imagePickerVC.delegate = self;
    imagePickerVC.allowsEditing = YES;
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        imagePickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    else {
        NSLog(@"Camera 🚫 available so we will use photo library instead");
        imagePickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    [self presentViewController:imagePickerVC animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    UIImage *editedImage = info[UIImagePickerControllerEditedImage];
    
   self.user.profilePicture = [Post getPFFileFromImage:editedImage];
    [self.user saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        //have user data save
        NSLog(@"sgvdkw");
        [self dismissViewControllerAnimated:YES completion:^{
            //[self.collectionView reloadData];
        }];
        [self.collectionView reloadData];
    }];
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    //adding segue to details view page
    UICollectionViewCell *tappedCell = sender;
    NSIndexPath *indexPath = [self.collectionView indexPathForCell:tappedCell];
    Post *post = self.posts[indexPath.item];
    
    DetailsViewController *detailsViewController = [segue destinationViewController];
    detailsViewController.post = post;
    
    
}



@end

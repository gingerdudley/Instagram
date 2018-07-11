//
//  ProfileCollectionViewController.m
//  Instagram
//
//  Created by Ginger Dudley on 7/10/18.
//  Copyright © 2018 Ginger Dudley. All rights reserved.
//

#import "ProfileCollectionViewController.h"
#import "Post.h"
#import "ProfilePostCell.h"
#import "Parse.h"
#import "AppDelegate.h"

@interface ProfileCollectionViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

//@dynamic (weak, nonatomic) IBOutlet UICollectionView *collectionView;
//confused about this
//@dynamic (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSArray *posts;

@end


@implementation ProfileCollectionViewController

//what is this??
static NSString * const reuseIdentifier = @"ProfilePostCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
    //need to add a fetch posts for the collection view to add the specific users posts
    [self fetchPosts];
    
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
    CGFloat postersPerline = 3;
    
    CGFloat itemWidth = self.collectionView.frame.size.width / postersPerline;
    CGFloat itemHeight = itemWidth * 1.5;
    layout.itemSize = CGSizeMake( itemWidth, itemHeight);
    
    // Register cell classes
    
    //???
    //[self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)fetchPosts{
    PFQuery *query = [PFQuery queryWithClassName:@"Post"];
    
    //refine this query into a smaller query that has the conditional of being posted by the user??
    
    //query constraints- look up in documentation
    
    //filtering out the query
    [query includeKey:@"author"];
    [query whereKey:@"author" notEqualTo:[PFUser currentUser]];
    //query.limit = 20;
    
    
    //might need to ass this back in later so the query has the full details
    //[query orderByDescending:@"createdAt"];
    //[query includeKey:@"author"];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *posts, NSError *error) {
        if (posts != nil) {
            self.posts = posts;
        } else {
            NSLog(@"%@", error.localizedDescription);
        }
        [self.collectionView reloadData];
    }];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

//- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
//    return self.posts.count;
//}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.posts.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    //UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    ProfilePostCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.post = self.posts[indexPath.item];
    //adding immage to the image view
    cell.postImage.image = cell.post.image;
    
    // Configure the cell
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end

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

@interface ProfileGridViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (strong, nonatomic) NSArray *posts;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;


@end

@implementation ProfileGridViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [self fetchPosts];
    
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
    
    //refine this query into a smaller query that has the conditional of being posted by the user??
    
    //query constraints- look up in documentation
    
    //filtering out the query
    //[query includeKey:@"author"];
    //[query whereKey:@"author" notEqualTo:[PFUser currentUser]];
    [query whereKey:@"author" equalTo:[PFUser currentUser]];
    //query.limit = 20;
    
    
    //might need to ass this back in later so the query has the full details
    [query orderByDescending:@"createdAt"];
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

//- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//    return self.posts.count;
//}
- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    //NSLog(@"%lu", self.posts.count);
    return self.posts.count;
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    ProfilePostCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ProfilePostCell" forIndexPath:indexPath];
    
    cell.post = self.posts[indexPath.item];
    
    return cell;
}

//adding the resuable header to the collection view
//- (UICollectionViewReusableView *)collectionView:
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    ProfileHeaderView *header = nil;
    if( kind == UICollectionElementKindSectionHeader){
        header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"ProfileHeaderView" forIndexPath:indexPath];
        
        //header.testerLabel.text = @"my name is ginger";
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

//
//  HomeViewController.m
//  Instagram
//
//  Created by Ginger Dudley on 7/9/18.
//  Copyright © 2018 Ginger Dudley. All rights reserved.
//

#import "HomeViewController.h"
#import "Parse.h"
#import "AppDelegate.h"
#import "Post.h"
#import "PostTableViewCell.h"

@interface HomeViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

//adding refresh control
@property (nonatomic, strong) UIRefreshControl *refreshControl;
@property (strong, nonatomic) NSArray *posts;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(fetchPost:) forControlEvents:UIControlEventValueChanged];
    [self.tableView insertSubview:refreshControl atIndex:0];
    
    [self fetchPost: refreshControl];
    
}

- (void) fetchPost:(UIRefreshControl *) refreshControl{
    //NSLog(@"fetch");
    PFQuery *query = [PFQuery queryWithClassName:@"Post"];
    query.limit = 20;
    [query orderByDescending:@"createdAt"];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *posts, NSError *error) {
        //NSLog(@"in closure");
        if (posts != nil) {
            // do something with the array of object returned by the call
            self.posts = posts;
            //NSLog(@"%lu", posts.count);
            /*for (Post *post in posts) {
                NSLog(@"%@", post.caption);
            }*/
        } else {
            NSLog(@"%@", error.localizedDescription);
        }
        
        [self.tableView reloadData];
        [refreshControl endRefreshing];
        
        
    }];
    
    //NSLog(@"past closure");
     
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.posts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    PostTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PostCell" forIndexPath:indexPath];
    cell.post = self.posts[indexPath.row];
    return cell;
}

- (IBAction)didTapLogout:(id)sender {
    [PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error) {
        // PFUser.current() will now be nil
        AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        //switched home view controller
        HomeViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
        appDelegate.window.rootViewController = loginViewController;
    }];
    
}

- (IBAction)didTapCompose:(id)sender {
    
    [self performSegueWithIdentifier:@"composeSegue" sender:nil];
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

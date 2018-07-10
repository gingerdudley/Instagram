//
//  ComposeViewController.m
//  Instagram
//
//  Created by Ginger Dudley on 7/9/18.
//  Copyright © 2018 Ginger Dudley. All rights reserved.
//

#import "ComposeViewController.h"
#import "Parse.h"
#import "AppDelegate.h"
#import "Post.h"

//trying to debug query cancelled
//#import ""

@interface ComposeViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *uploadedImage;
@property (strong, nonatomic) UIImage *savedImage;
@property (weak, nonatomic) IBOutlet UITextField *captionTextField;
@property (strong, nonatomic) NSString *captionText;
//@property (strong, nonatomic) UIImage

@end

@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //adding this here but might need to move it to after the user taps on the image
    UIImagePickerController *imagePickerVC = [UIImagePickerController new];
    imagePickerVC.delegate = self;
    imagePickerVC.allowsEditing = YES;
    //imagePickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;

    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        imagePickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    else {
        NSLog(@"Camera 🚫 available so we will use photo library instead");
        imagePickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }

    [self presentViewController:imagePickerVC animated:YES completion:nil];
    
    //move this to did Tap share??
    
    //self.captionText = self.captionTextField.text;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didTapCancel:(id)sender {
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    //switched home view controller
    ComposeViewController *homeViewController = [storyboard instantiateViewControllerWithIdentifier:@"home"];
    appDelegate.window.rootViewController = homeViewController;
}
- (IBAction)didTapShare:(id)sender {
    
    //pass to postUserImage
    [Post postUserImage:self.savedImage withCaption:self.captionTextField.text withCompletion:^(BOOL succeeded, NSError * _Nullable error) {
        NSLog(@"posting picture....");
        if (error) {
            NSLog(@"error posting picture");
        }
        else{
            NSLog(@"successfully posted picture");
        }
        //[self.view endEditing:YES];
        //[self.captionTextField resignFirstResponder];
        
    }];
    
    
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    //switched home view controller
    ComposeViewController *homeViewController = [storyboard instantiateViewControllerWithIdentifier:@"home"];
    appDelegate.window.rootViewController = homeViewController;
    
    [[self view] endEditing:YES];
    
    //easier way to change modal view controller
    
    
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    // Get the image captured by the UIImagePickerController
    UIImage *originalImage = info[UIImagePickerControllerOriginalImage];
    
    //editing the image???? 
    UIImage *editedImage = info[UIImagePickerControllerEditedImage];
    
    // Do something with the images (based on your use case)
    //self.savedImage = originalImage;
    self.savedImage = editedImage;
    self.uploadedImage.image = self.savedImage;
    //self.uploadedImage.image = originalImage;
    
    
    // Dismiss UIImagePickerController to go back to your original view controller
    [self dismissViewControllerAnimated:YES completion:nil];
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

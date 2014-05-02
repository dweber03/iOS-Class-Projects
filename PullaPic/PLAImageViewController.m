//
//  PLAImageViewController.m
//  PullaPic
//
//  Created by Derek Weber on 4/30/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import "PLAImageViewController.h"
#import "PLAImagePickerController.h"
#import "PLAFilterController.h"
#import "ControlVC.h"


@interface PLAImageViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate, PLAFilterControllerDelegate>




@property (nonatomic) UIImage * originalImage;

@end

@implementation PLAImageViewController

{
    UIImageView * imageView;
//    UIButton * getPhotos;
    PLAFilterController * filterVC;
    
    
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
//        header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
//        
//        header.backgroundColor = [UIColor redColor];
//        
//        [self.view addSubview:header];
//        
//        getPhotos = [[UIButton alloc]initWithFrame: CGRectMake(110, 25, 100, 25)];
        
       
                     
        
//        getPhotos.backgroundColor = [UIColor blackColor];
//        getPhotos.layer.cornerRadius = 6;
//        
//        [getPhotos addTarget:self action:@selector(getPics) forControlEvents:UIControlEventTouchUpInside];
//        [self.view addSubview:getPhotos];
        }
    return self;
}


//-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
//{
//    
//}
    
    
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Jo's explanation for creating the app
    
    imageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:imageView];
    
    UIView * navBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
    navBar.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.8];
    
    [self.view addSubview:navBar];
    
    UIButton * libraryButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 30, 30)];
    libraryButton.layer.cornerRadius = 15;
    libraryButton.backgroundColor = [UIColor whiteColor];
    
    [libraryButton addTarget:self action:@selector(choosePhoto) forControlEvents:UIControlEventTouchUpInside];
    
    [navBar addSubview:libraryButton];
    
    filterVC = [[PLAFilterController alloc] initWithNibName:nil bundle:nil];
    filterVC.delegate = self;
    
    filterVC.view.frame = CGRectMake((0), SCREEN_HEIGHT - 100, SCREEN_WIDTH, 100);
    
    [self.view addSubview:filterVC.view];
    
    
    
    
//    
//    UIView * scrollBar = [[UIView alloc]initWithFrame:CGRectMake(0, 460, 320, 100)];
//    scrollBar.backgroundColor = [UIColor blackColor];
//    [self.view addSubview:scrollBar];
//    
//    UICollectionViewController * scrollBar = [[UICollectionViewController alloc] initWithCollectionViewLayout:UICollectionViewScrollDirectionHorizontal];
    
    
}

-(void)choosePhoto
{
    UIImagePickerController * picker = [[UIImagePickerController alloc] init];
        picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
        [self presentViewController:picker animated:YES completion:nil];
    
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    self.originalImage = info[UIImagePickerControllerOriginalImage];
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];

}

-(void)setOriginalImage:(UIImage *)originalImage
{
    _originalImage = originalImage;
    
    filterVC.imageToFilter = originalImage;
    
    imageView.image = originalImage;
    
}

-(void)updateCurrentImageWithFilteredImage: (UIImage *) image;
{
    imageView.image = image;
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

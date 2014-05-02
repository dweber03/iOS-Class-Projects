//
//  PLAFilterController.m
//  PullaPic
//
//  Created by Derek Weber on 5/1/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import "PLAFilterController.h"

#import "PLAImageViewController.h"


@interface PLAFilterController ()

@property(nonatomic) NSString * currentFilter;


@end

@implementation PLAFilterController
{
    UIScrollView * scroller;
    NSArray * filterNames;
    NSMutableArray * filterButtons;
    
    float wh;
    
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.view.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.7];
        filterButtons = [@[] mutableCopy];
        filterNames = @[
                        @"CIColorInvert",
                        @"CIColorMonochrome",
                        @"CIColorPosterize",
                        @"CIFalseColor",
                        @"CIMaximumComponent",
                        @"CIMinimumComponent",
                        @"CIPhotoEffectChrome",
                        @"CIPhotoEffectFade",
                        @"CIPhotoEffectInstant",
                        @"CIPhotoEffectMono",
                        @"CIPhotoEffectNoir",
                        @"CIPhotoEffectProcess",
                        @"CIPhotoEffectTonal",
                        @"CIPhotoEffectTransfer",
                        @"CISepiaTone",
                        @"CIVignette",
                        @"CIVignetteEffect",
                        @"CIBumpDistortion",
                        @"CIBumpDistortionLinear",
                        @"CICircleSplashDistortion",
                        @"CICircularWrap",
                        @"CIDroste",
                        @"CIDisplacementDistortion",
                        @"CIGlassDistortion",
                        @"CIGlassLozenge",
                        @"CIHoleDistortion",
                        @"CILightTunnel",
                        @"CIPinchDistortion",
                        @"CIStretchCrop",
                        @"CITorusLensDistortion",
                        @"CITwirlDistortion",
                        @"CIVortexDistortion"
                        ];
        
        
        scroller = [[UIScrollView alloc] init];
        
        
        //        scroller.scrollEnabled = YES;
        [self.view addSubview:scroller];
        
        
    }
    return self;
}

- (void)viewWillLayoutSubviews
{
    [super viewDidLoad];
    
    wh = self.view.frame.size.height - 20;
    
    for (NSString * filterName in filterNames) {
        
        
        int i = (int)[filterNames indexOfObject:filterName];
        int x = (wh + 10) * i + 10;
        
        UIButton * filterButton = [[UIButton alloc] initWithFrame:CGRectMake(x, 10, wh, wh)];
        filterButton.tag = i;
        filterButton.backgroundColor = [UIColor whiteColor];
        [filterButton addTarget:self action:@selector(switchFilter:) forControlEvents:UIControlEventTouchUpInside];
        [filterButtons addObject:filterButton];
        
        [scroller addSubview:filterButton];
        
    }
    
    scroller.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    scroller.contentSize = CGSizeMake((wh + 10) * [filterNames count] + 10, self.view.frame.size.height);
    
    [self.view addSubview:scroller];
    
}

- (UIImage *)filterImage:(UIImage *)image filterName:(NSString *) filterName
{
    CIImage * ciImage = [CIImage imageWithCGImage:image.CGImage];
    
    CIFilter * filter = [CIFilter filterWithName:filterName];
    
    [filter setValue:ciImage forKeyPath:kCIInputImageKey];
    
    CIContext * ciContext = [CIContext contextWithOptions:nil];
    
    CIImage * ciResult = [filter valueForKeyPath:kCIOutputImageKey];
    
    return [UIImage imageWithCGImage:[ciContext createCGImage:ciResult fromRect:[ciResult extent]]];
    
}

-(void)switchFilter:(UIButton *)filterButton
{
    self.currentFilter = [filterNames objectAtIndex:filterButton.tag];
    
    UIImage * image = [self filterImage:self.imageToFilter filterName:self.currentFilter];
    
    
    [self.delegate updateCurrentImageWithFilteredImage:image];
    
    
    
    
    //    [self filterImage:[self shrinkImage: self.imageToFilter maxWH: SCREEN_WIDTH * 2] filterName:self.currentFilter]]];
    
    
    
    
}

-(void)setImageToFilter:(UIImage *)imageToFilter
{
    _imageToFilter = imageToFilter;
    
    for (UIButton * filterButton in filterButtons)
    {
        
        [filterButton setImage:nil forState:UIControlStateNormal];
        
        NSString * filterName = [filterNames objectAtIndex:filterButton.tag];
        
        
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, (unsigned long)NULL), ^{
            
            UIImage * smallImage = [self shrinkImage:imageToFilter maxWH:wh];
            
            UIImage * image = [self filterImage:smallImage filterName:filterName];
            
            dispatch_async(dispatch_get_main_queue(), ^(void){
                
                [filterButton setImage:image forState:UIControlStateNormal];
                
                filterButton.imageView.contentMode = UIViewContentModeScaleAspectFill;
            });
            
            
            
            
        });
        
        
        
        
    }
}

-(UIImage *)shrinkImage:(UIImage *)image maxWH:(int)widthHeight
    {
        CGSize size = CGSizeMake(widthHeight, widthHeight / image.size.width * image.size.height);
        
        if (image.size.height < image.size.width)
        {
            size = CGSizeMake(widthHeight / image.size.height * image.size.width, widthHeight);
        }
        
        UIGraphicsBeginImageContext(size);
        [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
        UIImage * destImage = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        return destImage;
        
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

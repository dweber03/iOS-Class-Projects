//
//  STASelectVC.m
//  Status
//
//  Created by Derek Weber on 5/19/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import "STASelectVC.h"
#import "STTwitter.h"
#import <CoreLocation/CoreLocation.h>

@interface STASelectVC () <CLLocationManagerDelegate>



@end

@implementation STASelectVC
{
    UIButton * postButton;
    UIImageView * bigSmilie;
    UIButton * twitter;
//    UIButton * gPlus;
    UIButton * facebook;
    STTwitterAPI * tweet;
    UITextField * tweetField;
    
    CLLocationManager * lManager;
    CLLocation * currentLocation;
    
    NSString * locationLat;
    NSString * locationLng;
    
    
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        lManager = [[CLLocationManager alloc]init];
        lManager.delegate = self;
        [lManager startUpdatingLocation];
        
    }
    return self;
}

-(void)locationManager:(CLLocationManager*)manager didUpdateLocations:(NSArray *)locations
{
    currentLocation = [locations objectAtIndex:0];
    [lManager stopUpdatingLocation];
    
    
    CLGeocoder * geoCoder = [[CLGeocoder alloc] init];
    
    [geoCoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray *placemarks, NSError *error)
     
    {
         CLPlacemark * placemark = [placemarks objectAtIndex:0];
         NSLog(@"Current Location Detected");
         NSLog(@"placemark %@", placemark);
         NSString * locatedAt = [[placemark.addressDictionary valueForKey:@"FormattedAddressLines"]componentsJoinedByString:@","];
         NSString * address = [[NSString alloc]initWithString:locatedAt];
         NSString * area = [[NSString alloc]initWithString:placemark.locality];
         NSLog(@"%@, %@", address, area);
     }];
    
    locationLat = [[NSString alloc]initWithFormat:@"%g",currentLocation.coordinate.latitude];
    locationLng = [[NSString alloc]initWithFormat:@"%g", currentLocation.coordinate.longitude];

    
//         {
//             for (CLPlacemark * placemark in placemarks)
//             {
//                 NSLog(@"%@", placemark);
//                 
//                 NSString * cityState = [NSString stringWithFormat:@"%@, %@", placemark.addressDictionary[@"City"],placemark.addressDictionary[@"State"]];
//                 NSLog(@"%@", cityState);
//             }
//             
//         }];
////
//    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    int w = [UIScreen mainScreen].bounds.size.width;
    int h = [UIScreen mainScreen].bounds.size.height;
    tweetField = [[UITextField alloc]initWithFrame: CGRectMake(20, 20, w - 40, h - 296)];
    [self.view addSubview:tweetField];
    
    
    twitter = [[UIButton alloc] initWithFrame: CGRectMake(64, 32, 48, 48)];
    [twitter setImage:[UIImage imageNamed:@"sm_twitter_g"] forState:UIControlStateNormal];
//    [twitter setImage:[UIImage imageNamed:@"sm_twitter"] forState:UIControlStateSelected];
    [twitter addTarget:self action:@selector(tweet:) forControlEvents:UIControlEventTouchUpInside];
    twitter.selected = YES;

    [self.view addSubview:twitter];
    
//    gPlus = [[UIButton alloc] initWithFrame: CGRectMake(128, 32, 48, 48)];
//    [gPlus setImage:[UIImage imageNamed:@"sm_google_g"] forState:UIControlStateNormal];
////    [gPlus setImage:[UIImage imageNamed:@"sm_google"] forState:UIControlStateHighlighted];
//    [gPlus addTarget:self action:@selector(google:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:gPlus];
    
    facebook = [[UIButton alloc] initWithFrame: CGRectMake(194, 32, 48, 48)];
    [facebook setImage:[UIImage imageNamed:@"sm_facebook_g"] forState:UIControlStateNormal];
//    [facebook setImage:[UIImage imageNamed:@"sm_facebook"] forState:UIControlStateHighlighted];
    [facebook addTarget:self action:@selector(facebookPost:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:facebook];
    
    
    postButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [postButton setFrame:CGRectMake(self.view.frame.size.width / 2 - 40, 400, 48, 66)];
    [postButton setImage:[UIImage imageNamed:@"check"] forState:UIControlStateNormal];
    [postButton addTarget:self action:@selector(selectView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:postButton];

    
    
    bigSmilie = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 2 - 100, self.view.frame.size.height / 2 - 100, 191, 191)];
    [bigSmilie setImage:[UIImage imageNamed:@"big_smilie"]];
    [self.view addSubview:bigSmilie];
    
    
    
    

    
}

-(void)tweet:(id)sender
{
    _toggleIsOn = !_toggleIsOn;
    
    {
        if(_toggleIsOn)
        {
            [twitter setImage:[UIImage imageNamed:@"sm_twitter"] forState:UIControlStateNormal];
            {
                tweet = [STTwitterAPI twitterAPIOSWithFirstAccount];
                
                [tweet verifyCredentialsWithSuccessBlock:^(NSString *username)
                 {
                     NSLog(@"%@", username);
                 } errorBlock:^(NSError *error)
                 {
                     NSLog(@"%@", error.userInfo);
                 }];
            }
        }
        else
        {
            [twitter setImage:[UIImage imageNamed:@"sm_twitter_g"] forState:UIControlStateNormal];
        }
        
        
    }
}

//-(void)google:(id)sender
//{
//    _toggleIsOn = !_toggleIsOn;
//    
//    {
//        if(_toggleIsOn)
//        {
//            [gPlus setImage:[UIImage imageNamed:@"sM_google"] forState:UIControlStateNormal];
//        }
//        else
//        {
//            [gPlus setImage:[UIImage imageNamed:@"sm_google_g"] forState:UIControlStateNormal];
//        }
//        
//        
//    }
//}

-(void)facebookPost:(id)sender
{
    _toggleIsOn = !_toggleIsOn;
    
    {
        if(_toggleIsOn)
        {
            [facebook setImage:[UIImage imageNamed:@"sm_facebook"] forState:UIControlStateNormal];
        }
        else
        {
            [facebook setImage:[UIImage imageNamed:@"sm_facebook_g"] forState:UIControlStateNormal];
        }
        
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)selectView
{
    
    
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * documentPath = paths[0];
    
    NSData * imageData = UIImagePNGRepresentation(bigSmilie);
    
    NSString* pngPath = [documentPath stringByAppendingPathComponent:@"yellow_1.png"];
    [imageData writeToFile:pngPath atomically:YES];
    NSURL * url = [NSURL fileURLWithPath:pngPath];
    
    [tweet postStatusUpdate:tweetField.text inReplyToStatusID:nil latitude:locationLat longitude:locationLng placeID:nil displayCoordinates:nil trimUser:nil successBlock:^(NSDictionary *status)
    
    {
        NSLog(@"%@", status);
    } errorBlock:^(NSError *error)
    
    {
        NSLog(@"%@",error.userInfo);
    }];

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

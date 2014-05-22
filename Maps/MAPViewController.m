//
//  MAPViewController.m
//  Maps
//
//  Created by Derek Weber on 5/21/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import "MAPViewController.h"

#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "MAPAnnotation.h"


@interface MAPViewController ()<CLLocationManagerDelegate, MKMapViewDelegate>

@end

@implementation MAPViewController
{
    CLLocationManager * lManager;
    MKMapView * mymapView;
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        lManager = [[CLLocationManager alloc]init];
        lManager.delegate = self;
        lManager.distanceFilter = 1000;
        lManager.desiredAccuracy = kCLLocationAccuracyKilometer;
        
        [lManager startUpdatingLocation];
        
        UIGestureRecognizer * tap = [[UIGestureRecognizer alloc] initWithTarget:self action:@selector(tapScreen:)];
        
        [self.view addGestureRecognizer:tap];

        
    }
    return self;
}

-(void)locationManager:(CLLocationManager*)manager didUpdateLocations:(NSArray *)locations
{
    // Removes marker from your last location on the Map
//    [mymapView removeAnnotations:mymapView.annotations];
    
    
    for (CLLocation * location in locations)
    {
        MAPAnnotation * annotation = [[MAPAnnotation alloc]initWithCoordinate:location.coordinate];
        
        annotation.title = @"Marker";
        annotation.subtitle = @"string";
        
        [mymapView addAnnotation:annotation];
        
        // Performs animation on the Map to slide from 1 location to the next
        
        MKCoordinateRegion region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(1.0, 1.0));
//                                                           
//        
//        // Allows you to ZOOM on the map
//        
       [mymapView setRegion:region animated:YES];
        
    
        [mymapView selectAnnotation:annotation animated:YES];
        NSLog(@"%@", location);
        
        
        // Use CLGeocoder to get you street, city & State Address
        CLGeocoder * geoCoder = [[CLGeocoder alloc] init];
        [geoCoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error)
    
        {
            for (CLPlacemark * placemark in placemarks)
            {
                NSLog(@"%@", placemark);
                
                NSString * cityState = [NSString stringWithFormat:@"%@, %@", placemark.addressDictionary[@"City"],placemark.addressDictionary[@"State"]];
                
                
                [annotation setTitle:cityState];
                
                [annotation setSubtitle:placemark.country];
            }
            
        }];

    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // MKAnnotation is marker on the map. MKAnnotation is a PROTOCOL not a CLASS. MKAnnotation can NOT be Subclassed
    
    mymapView = [[MKMapView alloc]initWithFrame:self.view.frame];
    
    mymapView.delegate = self;
    
    [self.view addSubview:mymapView];
    
}

-(void)tapScreen:(UIGestureRecognizer *)ml
{
    
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    MKAnnotationView * annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:@"annotationView"];
    
    if (annotationView == nil)
    {
        annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"annotationView"];
    } else {
        annotationView.annotation = annotation;
    }
    
//    annotationView.draggable = YES;
    annotationView.canShowCallout = YES;
    return annotationView;
    
}

-(void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{
    
    
}

-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view didChangeDragState:(MKAnnotationViewDragState)newState fromOldState:(MKAnnotationViewDragState)oldState
{
    NSLog(@"new state : %d and old state %d", (int)newState, (int)oldState);
    
    switch ((int)newState)
    {
        case 0: //not dragging
        {
            [mapView setCenterCoordinate:view.annotation.coordinate animated:YES];
            
            CLGeocoder * geoCoder = [[CLGeocoder alloc] init];
            
            CLLocation * location = [[CLLocation alloc]initWithLatitude:view.annotation.coordinate.latitude longitude:view.annotation.coordinate.longitude];
            
            
            [geoCoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error)
             
             {
                 for (CLPlacemark * placemark in placemarks)
                 {
                     NSLog(@"%@", placemark.addressDictionary);
                     
                     NSString * cityState = [NSString stringWithFormat:@"%@, %@", placemark.addressDictionary[@"City"],placemark.addressDictionary[@"State"]];
                     
                    
                     [(MAPAnnotation *)view.annotation setTitle:cityState];

                     [(MAPAnnotation *)view.annotation setSubtitle:placemark.country];
                 }
             
             }];
        }
            break;
            
        case 1: //starting drag
            break;
            
        case 2:
            break;
            
        case 4:
            break;
            
        default:
            break;
    }
}

@end

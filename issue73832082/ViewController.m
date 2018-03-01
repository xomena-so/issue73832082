//
//  ViewController.m
//  issue73832082
//
//  Created by Google Training 2 on 01/03/2018.
//  Copyright © 2018 Google Trainining. All rights reserved.
//

#import "ViewController.h"
#import <GoogleMaps/GoogleMaps.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)loadView {
    // Prepare map
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:46.50303151543495
                                                            longitude:6.483627408742905
                                                                 zoom:18];
    GMSMapView *mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView.mapType = kGMSTypeHybrid;
    self.view = mapView;
    
    // Prepare UIImage
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(20.f, 20.f), NO, 0.0f);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSaveGState(ctx);
    CGRect rect = CGRectMake(0, 0, 20, 20);
    CGContextSetFillColorWithColor(ctx, UIColor.redColor.CGColor);
    CGContextFillEllipseInRect(ctx, rect);
    CGContextRestoreGState(ctx);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    // Prepare UIImageView
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(200, 200, 100, 100)];
    imageView.image = image;
    
    // Add marker
    CLLocationCoordinate2D position = CLLocationCoordinate2DMake(46.50303151543495, 6.483627408742905);
    GMSMarker *marker = [GMSMarker new];
    marker.position = position;
    marker.iconView = imageView;
    marker.groundAnchor = CGPointMake(0.5f, 0.5f);
    marker.tappable = NO;
    marker.map = mapView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

//
//  ViewController.m
//  TmapTest
//
//  Created by SDT-1 on 2014. 1. 17..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"
#import "TMapView.h"

#define APP_KEY @"230febe2-ce30-303c-a8d1-827c4104161b"
#define TOOLBAR_HIGHT 60


@interface ViewController ()<UISearchBarDelegate>

@end

@implementation ViewController
- (IBAction)moveTon:(id)sender {
    
    TMapPoint *centerPoint = [[TMapPoint alloc] initWithLon:126.988220 Lat:37.551178];
    [_mapView setCenterPoint:centerPoint];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    CLLocationCoordinate2D coord[5] = {
        CLLocationCoordinate2DMake(37.460143, 126.914062),
        CLLocationCoordinate2DMake(37.469136, 126.981869),
        CLLocationCoordinate2DMake(37.437930, 126.989937),
        CLLocationCoordinate2DMake(37.413255, 126.959038),
        CLLocationCoordinate2DMake(37.426752, 126.913548),
        
    };
    
    
    TMapPolygon *polygon = [[TMapPolygon alloc] init];
    [polygon setLineColor:[UIColor redColor]];
    
    [polygon setPolygonAlpha:0];
    [polygon setLineWidth:8.0];
    
    for (int i = 5; i < 5; i++) {
        [polygon addPolygonPoint:[TMapPoint mapPointWithCoordinate:coord[i]]];
    }
    
    [_mapView addTMapPolygonID:@"관악산" Polygon:polygon];
    
	// Do any additional setup after loading the view, typically from a nib.
    CGRect rect = CGRectMake(0, TOOLBAR_HIGHT, 320, 300);
    _mapView = [[TMapView alloc] initWithFrame:rect];
    [_mapView setSKPMapApiKey:APP_KEY];
    [self.view addSubview:_mapView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

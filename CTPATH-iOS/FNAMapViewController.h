//
//  FNAMapViewController.h
//  CTPATH-iOS
//
//  Created by fran on 25/2/16.
//  Copyright © 2016 fran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "FNASuggestionsTableViewController.h"
#import "FNALoginViewController.h"
#define URL_API @"http://mallba3.lcc.uma.es/otp/routers/default"

#define SUGGESTIONS_APPEAR_NOTIFICATION_NAME  @"SUGGESTIONS_APPEAR_NOTIFICATION"

@class FNAMapView;
@class FNAItineraryDetailView;
@class FNARoute;
@class FNARestClient;
@class FNADirectionsTableView;

@interface FNAMapViewController : UIViewController <MKMapViewDelegate,CLLocationManagerDelegate,UITableViewDelegate,UISearchBarDelegate,FNASuggestionsTableViewDelegate,LoginViewDelegate>

@property (strong,nonatomic)  UITableView *suggestionTableView;
@property (strong,nonatomic) CLLocationManager  * locationManager;
@property (strong,nonatomic) FNARestClient * restclient;
@property (strong,nonatomic) NSString * userAuthenticationToken;

@property (strong,nonatomic) FNAItineraryDetailView * itinerary;
@property (strong,nonatomic) FNADirectionsTableView * directionsTableView;
@property (strong,nonatomic) FNARoute * route;

@property (weak, nonatomic) IBOutlet FNAMapView *mapView;
@property (weak, nonatomic) IBOutlet UISearchBar *startSearchBar;
@property (weak, nonatomic) IBOutlet UISearchBar *goalSearchBar;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityView;
@property (weak, nonatomic) IBOutlet UIToolbar *bottomToolbar;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *itinerariesButton;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *directionsButton;


- (IBAction) removeItinerariesView:(id)sender;
- (IBAction) centerMapAtCoordinates:(id) sender;
- (IBAction) showDirections:(id)sender;

@end

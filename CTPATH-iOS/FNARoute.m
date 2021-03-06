//
//  FNAPlan.m
//  CTPATH-iOS
//
//  Created by fran on 13/3/16.
//  Copyright © 2016 fran. All rights reserved.
//

#import "FNARoute.h"
#import "FNAColor.h"
@implementation FNARoute

-(id) initWithRoute:(NSDictionary *) route{
    
    if(!route) return nil;

    if(self = [super init]){
        
        _route = route;
    }
    return self;
}


-(NSString *) error{
    
    return [self.route objectForKey:@"error"];
}
-(NSDictionary *) requestParameters {
    return [self.route objectForKey:@"requestParameters"];
}

-(NSString *) date{
    
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"MM-dd-yyyy";
    NSDate *date = [dateFormatter dateFromString:[[self requestParameters] objectForKey:@"date"]];
    dateFormatter.dateFormat = @"dd-MM-yyyy";
    
    return [dateFormatter stringFromDate:date];
}

-(NSString *) time{
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"hh:mma";
    NSDate *date = [dateFormatter dateFromString:[[self requestParameters] objectForKey:@"time"]];
    dateFormatter.dateFormat = @"HH:mm";
    return [dateFormatter stringFromDate:date];
}

-(NSDictionary *) plan{
    
    return [self.route objectForKey:@"plan"];
}
-(NSArray *) itineraries{
    
    return [[self plan] objectForKey:@"itineraries"];
}
-(NSDictionary *) itineraryAtIndex:(NSUInteger)index{
    
    return [[self itineraries] objectAtIndex:index];
}

-(NSString *) durationAtIndex:(NSUInteger) index{
    int duration = [[[self itineraryAtIndex:index] objectForKey:@"duration"] intValue];
    int minutes = duration / 60;
    int seconds = duration % 60;
    
    NSString *time = [NSString stringWithFormat:@"%d:%02d", minutes, seconds];
    
    return time;
}

-(UIColor *) routeColorAtIndex:(NSUInteger) index{
    UIColor * color;
    
    if(index == 0){
        color = [FNAColor bestPathColorWithAlpha:1.0];
        
    }else if(index == 1){
        color = [FNAColor middlePathColorWithAlpha:1.0];
    }else{
        color = [FNAColor worstPathColorWithAlpha:1.0];
    }
    return color;
}

-(NSString *) pointsForItinerary:(NSDictionary *) itinerary{
    
    return [[[[itinerary objectForKey:@"legs"] objectAtIndex:0] objectForKey:@"legGeometry"] objectForKey:@"points"];
    
    
}
-(NSArray *) stepsForItinerary:(NSDictionary *) itinerary{
    
    return [[[itinerary objectForKey:@"legs"] objectAtIndex:0] objectForKey:@"steps"];
    
    
}

-(NSString *) carbonMonoxideForItinerary:(NSDictionary *) itinerary{
    
    return [NSString stringWithFormat:@"%ld",[[itinerary objectForKey:@"carbonMonoxide"]
                                             integerValue]/1000];
    
}

-(NSString *) carbonDioxideForItinerary:(NSDictionary *) itinerary{
    
    return [NSString stringWithFormat:@"%ld",[[itinerary objectForKey:@"carbonDioxide"]
                                            integerValue]/1000];
    
    
}

-(NSString *) hydrocarbureForItinerary:(NSDictionary *) itinerary{
    
    return [NSString stringWithFormat:@"%ld",[[itinerary objectForKey:@"hydrocarbure"]
                                            integerValue]/1000];
    
    
}

-(NSString *) nitrogenOxidesForItinerary:(NSDictionary *) itinerary{
    
    return [NSString stringWithFormat:@"%ld",[[itinerary objectForKey:@"nitrogenOxides"]
                                            integerValue]/1000];
    
    
}
@end

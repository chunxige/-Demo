//
//  CustomMapView.m
//  MapM
//
//  Created by chunxi on 2020/11/3.
//

#import "CustomMapView.h"

@implementation CustomMapView

- (MAMapRect)visibleMapRect {
    NSLog(@"current");
    return super.visibleMapRect;
}

- (void)setVisibleMapRect:(MAMapRect)visibleMapRect {
    super.visibleMapRect = visibleMapRect;
}

-(MAMapRect)mapRectForRect:(CGRect)rect {
    NSLog(@"%f %f %f %f", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
    return [super mapRectThatFits:mapRect];
}
@end

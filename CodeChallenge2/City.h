//
//  City.h
//  CodeChallenge2
//
//  Created by Tewodros Wondimu on 1/16/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//  Custom class named City with the necessary properties to hold the city‘s name and state
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface City : NSObject

- (instancetype) initWithCityName:(NSString *)name state:(NSString *)state image:(UIImage *)image url:(NSString *)url;

@property NSString *name;
@property NSString *state;
@property NSString *url;
@property UIImage *image;

@end

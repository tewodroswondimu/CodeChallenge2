//
//  City.h
//  CodeChallenge2
//
//  Created by Tewodros Wondimu on 1/16/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface City : NSObject

- (instancetype) initWithCityName:(NSString *)name state:(NSString *)state image:(UIImage *)image;

@property NSString *name;
@property NSString *state;
@property UIImage *image;

@end

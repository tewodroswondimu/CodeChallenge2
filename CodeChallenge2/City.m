//
//  City.m
//  CodeChallenge2
//
//  Created by Tewodros Wondimu on 1/16/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "City.h"

@implementation City

- (instancetype) initWithCityName:(NSString *)name state:(NSString *)state image:(UIImage *)image
{
    self = [super init];
    if (self) {
        self.name = name;
        self.state = state;
        self.image = image;
    }
    return self;
}

@end

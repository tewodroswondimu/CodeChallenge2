//
//  cityDetailViewController.h
//  CodeChallenge2
//
//  Created by Tewodros Wondimu on 1/16/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "City.h"

@protocol CityDetailViewControllerDelegate <NSObject>

- (void)changeNavigationTitle:(City *)city;

@end

@interface CityDetailViewController : UIViewController

@property City *city;

@property (nonatomic, weak) id<CityDetailViewControllerDelegate> delegate;

@end

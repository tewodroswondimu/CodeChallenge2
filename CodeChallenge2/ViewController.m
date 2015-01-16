//
//  ViewController.m
//  CodeChallenge2
//
//  Created by Tewodros Wondimu on 1/16/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "ViewController.h"
#import "City.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property NSMutableArray *cities;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    City *chicago = [[City alloc] initWithCityName:@"Chicago" state:@"Illinois" image:[UIImage imageNamed:@"Chicago"]];
    City *losAngeles = [[City alloc] initWithCityName:@"Los Angeles" state:@"California" image:[UIImage imageNamed:@"LosAngeles"]];
    City *newYork = [[City alloc] initWithCityName:@"New York" state:@"New York" image:[UIImage imageNamed:@"NewYork"]];
    City *philadelphia = [[City alloc] initWithCityName:@"Philadelphia" state:@"Pennsylvania" image:[UIImage imageNamed:@"Philadelphia"]];
    self.cities = [[NSMutableArray alloc] initWithObjects:chicago, losAngeles, newYork, philadelphia, nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cities.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CitiesTableViewCellID"];
    City *currentCity = [[City alloc] init];
    currentCity = [self.cities objectAtIndex:indexPath.row];
    cell.textLabel.text = currentCity.name;
    cell.detailTextLabel.text = currentCity.state;
    cell.imageView.image = currentCity.image;
    return cell;
}

@end

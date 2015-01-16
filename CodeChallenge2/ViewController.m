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
@property (weak, nonatomic) IBOutlet UITableView *citiesTableView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *editButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Programmatically created 4 cities using the custom City class
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

// Displays list of cities along with a description and an image
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

// Goes into editing mode when the edit button is pressed in the navigation bar
- (IBAction)onEditButtonPressed:(UIBarButtonItem *)sender
{
    if (!self.citiesTableView.editing)
    {
        self.editButton.title = @"Done";
        [self.citiesTableView setEditing:YES animated:YES];
    }
    else
    {
        self.editButton.title = @"Edit";
        [self.citiesTableView setEditing:NO animated:YES];
    }
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        [self.cities removeObjectAtIndex:indexPath.row];
    }
    [self.citiesTableView reloadData];
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

@end

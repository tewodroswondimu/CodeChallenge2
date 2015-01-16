//
//  ViewController.m
//  CodeChallenge2
//
//  Created by Tewodros Wondimu on 1/16/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "ViewController.h"
#import "CityDetailViewController.h"
#import "City.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *citiesTableView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *editButton;

@property CityDetailViewController *cityDetailViewController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Programmatically created 4 cities using the custom City class
    City *chicago = [[City alloc] initWithCityName:@"Chicago" state:@"Illinois" image:[UIImage imageNamed:@"Chicago"] url:@"en.wikipedia.org/wiki/Chicago"];
    City *losAngeles = [[City alloc] initWithCityName:@"Los Angeles" state:@"California" image:[UIImage imageNamed:@"LosAngeles"] url:@"en.wikipedia.org/wiki/Los_Angeles"];
    City *newYork = [[City alloc] initWithCityName:@"New York" state:@"New York" image:[UIImage imageNamed:@"NewYork"] url:@"en.wikipedia.org/wiki/New_York_City"];
    City *philadelphia = [[City alloc] initWithCityName:@"Philadelphia" state:@"Pennsylvania" image:[UIImage imageNamed:@"Philadelphia"] url:@"en.wikipedia.org/wiki/Philadelphia"];
    self.cities = [[NSMutableArray alloc] initWithObjects:chicago, losAngeles, newYork, philadelphia, nil];
    [self.citiesTableView reloadData];
}

// Reloads the table view data whenever the view appears again
- (void)viewDidAppear:(BOOL)animated
{
    [self.citiesTableView reloadData];
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

// When the delete button is pressed remove the city from the list
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

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Create an instance of the destination view controller
    CityDetailViewController *cdvc = segue.destinationViewController;

    // Create a UITableViewCell from the table view cell that was tapped
    UITableViewCell *cell = (UITableViewCell *)sender;

    // Assign the city property of the destination view controller's instance city that was tapped
    cdvc.city = [self.cities objectAtIndex:[[self.citiesTableView indexPathForCell:cell] row]];
    cdvc.cities = self.cities;
}

@end

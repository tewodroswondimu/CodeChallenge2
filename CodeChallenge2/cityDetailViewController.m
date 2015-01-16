//
//  cityDetailViewController.m
//  CodeChallenge2
//
//  Created by Tewodros Wondimu on 1/16/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "CityDetailViewController.h"
#import "WebViewController.h"

@interface CityDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UILabel *stateLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *editButton;
@property (weak, nonatomic) IBOutlet UITextField *cityTextField;
@property (weak, nonatomic) IBOutlet UITextField *stateTextField;

@property BOOL isInEditMode;

@end

@implementation CityDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.cityTextField.hidden = YES;
    self.stateTextField.hidden = YES;

    // On load, assign the UI elemnts the city's information
    self.cityLabel.text = self.city.name;
    self.stateLabel.text = self.city.state;
    self.imageView.image = self.city.image;
    self.isInEditMode = NO;
}

- (IBAction)onChangeNavButtonTapped:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(changeNavigationTitle:)]) {
        [self.delegate changeNavigationTitle:self.city];
    }
}

- (IBAction)onEditButtonPressed:(UIBarButtonItem *)sender
{

    if (!self.isInEditMode)
    {
        self.editButton.title = @"Done";
        self.cityTextField.text = self.city.name;
        self.stateTextField.text = self.city.state;
        self.cityTextField.hidden = NO;
        self.stateTextField.hidden = NO;
    }
    else
    {
        self.editButton.title = @"Edit";

        self.city.name = self.cityTextField.text;
        self.city.state = self.stateTextField.text;
        self.cityLabel.text = self.city.name;
        self.stateLabel.text = self.city.state;

        self.cityTextField.hidden = YES;
        self.stateTextField.hidden = YES;
    }
    self.isInEditMode = !self.isInEditMode;
}

// Pass the url of the city to the modal web view
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    WebViewController *wvc = segue.destinationViewController;
    wvc.url = self.city.url;
}

@end

//
//  SecondViewController.m
//  MeetupExample
//
//  Created by Yee Peng Chia on 9/26/13.
//  Copyright (c) 2013 Keen Code. All rights reserved.
//

#import "SearchViewController.h"
#import "Event+NetworkHelper.h"
#import "EventsListViewController.h"

@interface SearchViewController ()

@end

@implementation SearchViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)searchButtonClick:(id)sender
{
    NSMutableDictionary *searchTerms = [NSMutableDictionary dictionary];
    
    if (self.cityTextField.text) {
        [searchTerms setObject:self.cityTextField.text forKey:@"city"];
    }
    
    if (self.stateTextField.text) {
        [searchTerms setObject:self.stateTextField.text forKey:@"state"];
    }
    
    if (self.topicTextField.text) {
        [searchTerms setObject:self.topicTextField.text forKey:@"topic"];
    }
    
    if (self.textTextField.text) {
        [searchTerms setObject:self.textTextField.text forKey:@"text"];
    }
    
    [Event searchUpcomingEventsWithTerms:searchTerms onSuccess:^(NSArray *events) {
        EventsListViewController *listViewController = [self.storyboard instantiateViewControllerWithIdentifier:kEventsListViewControllerID];
        listViewController.events = events;
        listViewController.title = @"Results";
        [self.navigationController pushViewController:listViewController animated:YES];
    } onFailure:^(NSError *error) {
        // Handle failure
    }];
}

@end

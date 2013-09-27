//
//  UpcomingEventsViewController.h
//  MeetupExample
//
//  Created by Yee Peng Chia on 9/26/13.
//  Copyright (c) 2013 Keen Code. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString * const kEventsListViewControllerID;

@interface EventsListViewController : UITableViewController

@property (nonatomic, strong) NSArray *events;

@end

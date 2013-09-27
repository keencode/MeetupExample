//
//  UpcomingEventsTableCell.h
//  MeetupExample
//
//  Created by Yee Peng Chia on 9/26/13.
//  Copyright (c) 2013 Keen Code. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Event.h"

@interface UpcomingEventsTableCell : UITableViewCell

@property (nonatomic, strong) Event *event;
@property (nonatomic, weak) IBOutlet UILabel *dayLabel;
@property (nonatomic, weak) IBOutlet UILabel *monthLabel;
@property (nonatomic, weak) IBOutlet UILabel *dateLabel;
@property (nonatomic, weak) IBOutlet UILabel *timeLabel;
@property (nonatomic, weak) IBOutlet UILabel *groupNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *eventNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *rsvpLabel;
@property (nonatomic, weak) IBOutlet UIButton *favoriteButton;

- (IBAction)favoriteClicked:(id)sender;

@end

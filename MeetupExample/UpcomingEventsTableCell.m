//
//  UpcomingEventsTableCell.m
//  MeetupExample
//
//  Created by Yee Peng Chia on 9/26/13.
//  Copyright (c) 2013 Keen Code. All rights reserved.
//

#import "UpcomingEventsTableCell.h"

@implementation UpcomingEventsTableCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setEvent:(Event *)newEvent
{
    _event = newEvent;
    
    self.eventNameLabel.text = self.event.eventName;
    self.groupNameLabel.text = self.event.groupName;
    self.rsvpLabel.text = [NSString stringWithFormat:@"%@ members attending", self.event.rsvp];
    
    
}


@end

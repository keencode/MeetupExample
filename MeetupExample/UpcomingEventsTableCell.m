//
//  UpcomingEventsTableCell.m
//  MeetupExample
//
//  Created by Yee Peng Chia on 9/26/13.
//  Copyright (c) 2013 Keen Code. All rights reserved.
//

#import "UpcomingEventsTableCell.h"
#import "DateHelper.h"
#import "Event+NetworkHelper.h"

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
    
    self.dayLabel.text = [[DateHelper dayStringFromUTCTime:self.event.eventTime withOffset:self.event.utcOffset] uppercaseString];
    
    self.monthLabel.text = [[DateHelper monthStringFromUTCTime:self.event.eventTime withOffset:self.event.utcOffset] uppercaseString];
    
    self.dateLabel.text = [[DateHelper dateStringFromUTCTime:self.event.eventTime withOffset:self.event.utcOffset] uppercaseString];
    
    self.timeLabel.text = [[DateHelper timeStringFromUTCTime:self.event.eventTime withOffset:self.event.utcOffset] uppercaseString];
    
    [self updateFavoriteButton];
}

- (void)updateFavoriteButton
{
    if (self.event.isFavorite) {
        self.favoriteButton.selected = YES;
    } else {
        self.favoriteButton.selected = NO;
    }
}

- (IBAction)favoriteClicked:(id)sender
{
    __block id weakSelf = self;
    
    if (!self.event.isFavorite) {
        [self.event addFavoriteOnSuccess:^(BOOL success) {
            [weakSelf updateFavoriteButton];
        } onFailure:^(NSError *error) {
            // Handle failure
        }];
    } else {
        [self.event removeFavoriteOnSuccess:^(BOOL success) {
            [weakSelf updateFavoriteButton];
        } onFailure:^(NSError *error) {
            // Handle failure
        }];
    }
}

@end

//
//  SecondViewController.h
//  MeetupExample
//
//  Created by Yee Peng Chia on 9/26/13.
//  Copyright (c) 2013 Keen Code. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, strong) NSMutableArray *filteredEvents;

@property (nonatomic, weak) IBOutlet UITextField *stateTextField;
@property (nonatomic, weak) IBOutlet UITextField *cityTextField;
@property (nonatomic, weak) IBOutlet UITextField *topicTextField;
@property (nonatomic, weak) IBOutlet UITextField *textTextField;

- (IBAction)searchButtonClick:(id)sender;

@end

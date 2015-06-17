//
//  IACTableViewCell.h
//  Deque University for iOS
//
//  Created by Jennifer Dailey on 5/22/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import <UIKit/UIKit.h>

//! Interface for the Table View Cell containing the VoiceOver Simulation image and VoiceOver Simulation switch.
/*!
 * All elements are under one view in this cell for accessibility purposes. If any part of the cell is selected, the VoiceOver Simulation
 * switch will turn on or off. Because all elements are related, the entire cell only needs one accessibility label.  The accessibility
 * label is also dynamic - it lets the user know if the simulation is on or off.
 */
@interface IACTableViewCell : UITableViewCell

@end

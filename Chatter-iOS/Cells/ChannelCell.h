//
//  ChannelCell.h
//  Chatter-iOS
//
//  Created by Carlos Bedoy on 6/14/18.
//  Copyright © 2018 Carlos Bedoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Channel.h"
@interface ChannelCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *avatarView;
@property (weak, nonatomic) IBOutlet UILabel *nameView;
@property (weak, nonatomic) IBOutlet UILabel *messageView;
@property (nonatomic, strong) Channel *channel;
@end

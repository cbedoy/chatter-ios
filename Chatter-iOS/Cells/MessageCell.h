//
//  MessageCell.h
//  Chatter-iOS
//
//  Created by Carlos Bedoy on 6/18/18.
//  Copyright © 2018 Carlos Bedoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Message.h"
@interface MessageCell : UITableViewCell
@property (nonatomic, strong) Message *message;
@property (weak, nonatomic) IBOutlet UIImageView *avatarView;
@property (weak, nonatomic) IBOutlet UITextView *messageView;
@property (weak, nonatomic) IBOutlet UILabel *nicknameView;

@end

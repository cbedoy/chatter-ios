//
//  MessageCell.m
//  Chatter-iOS
//
//  Created by Carlos Bedoy on 6/18/18.
//  Copyright © 2018 Carlos Bedoy. All rights reserved.
//

#import "MessageCell.h"
#import "SDWebImage/UIImageView+WebCache.h"
@implementation MessageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.messageView.userInteractionEnabled = NO;
    [[[self avatarView] layer] setMasksToBounds:YES];
    [[[self avatarView] layer] setCornerRadius:[[self avatarView] frame].size.height / 2];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    
    self.nicknameView.text = self.message.nickname;
    self.messageView.text = self.message.rawMessage;
    [self.avatarView sd_setImageWithURL:[NSURL URLWithString:self.message.avatar]];
    
    float height = self.message.height;
    
    CGRect frame = self.messageView.frame;
    frame.origin.y = 12;
    frame.size.height = height - 24;

    [self.messageView setFrame:frame];
}



@end

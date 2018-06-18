//
//  ChannelCell.m
//  Chatter-iOS
//
//  Created by Carlos Bedoy on 6/14/18.
//  Copyright © 2018 Carlos Bedoy. All rights reserved.
//

#import "ChannelCell.h"

@implementation ChannelCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)reloadInputViews{
    [super reloadInputViews];
    
    self.nameView.text = self.channel.name;
    self.messageView.text = self.channel.message;
}


@end

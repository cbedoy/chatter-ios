//
//  ChannelCell.m
//  Chatter-iOS
//
//  Created by Carlos Bedoy on 6/14/18.
//  Copyright © 2018 Carlos Bedoy. All rights reserved.
//

#import "ChannelCell.h"
#import "SDWebImage/UIImageView+WebCache.h"
@implementation ChannelCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.messageView.userInteractionEnabled = NO;
    [[[self avatarView] layer] setMasksToBounds:YES];
    [[[self avatarView] layer] setCornerRadius:[[self avatarView] frame].size.height / 2];
}

- (void)reloadInputViews{
    [super reloadInputViews];
    
    self.nameView.text = self.channel.name;
    self.messageView.text = self.channel.message;
    
    [self.avatarView sd_setImageWithURL:[NSURL URLWithString:self.channel.avatar] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        
    }];
}


@end

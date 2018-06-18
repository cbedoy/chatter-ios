//
//  ChannelsViewController.m
//  Chatter-iOS
//
//  Created by Carlos Bedoy on 6/18/18.
//  Copyright © 2018 Carlos Bedoy. All rights reserved.
//

#import "ChannelsViewController.h"
#import "Channel.h"
#import "ChannelCell.h"
@interface ChannelsViewController ()

@end

@implementation ChannelsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[self tableView] registerNib:[UINib nibWithNibName:@"ChannelCell" bundle:nil] forCellReuseIdentifier:@"ChannelCell"];
    
    
    Channel *channel = [Channel new];
    [channel setName:@"General Room"];
    [channel setAvatar:@"avatar"];
    [channel setMessage:@"No messages..."];
    
    [[self dataModel] addObject:channel];
    
    channel = [Channel new];
    [channel setName:@"Fuckin' Room"];
    [channel setAvatar:@"avatar"];
    [channel setMessage:@"Nobody can save me!"];
    
    [[self dataModel] addObject:channel];
    
    [self setTitle:@"Channels"];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ChannelCell *cell = (ChannelCell* )[tableView dequeueReusableCellWithIdentifier:@"ChannelCell" forIndexPath:indexPath];
    
    cell.channel = self.dataModel[indexPath.row];
    
    [cell reloadInputViews];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Channel *channel = (Channel *)self.dataModel[indexPath.row];
    self.chatViewController.channel = channel;
    
    [self.navigationController pushViewController:self.chatViewController animated:YES];
}



@end

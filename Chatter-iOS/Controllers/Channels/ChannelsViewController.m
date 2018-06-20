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
    
    [self registerNib:@"ChannelCell"];
    
    Channel *channel = [Channel new];
    [channel setName:@"General Room"];
    [channel setAvatar:@"https://a0.muscache.com/im/pictures/75756707/5d76182c_original.jpg"];
    [channel setIdentifier:@"general_room"];
    [channel setMessage:@"No messages..."];
    
    [[self dataModel] addObject:channel];
    
    channel = [Channel new];
    [channel setName:@"Amazi' room"];
    [channel setAvatar:@"https://a0.muscache.com/im/pictures/828dbfd7-1259-413c-b99e-a9629d06a040.jpg"];
    [channel setIdentifier:@"amazing_room"];
    [channel setMessage:@"Nobody can save me!"];
    
    [[self dataModel] addObject:channel];
    
    
    NSString *ide = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    
    channel = [Channel new];
    [channel setName:@"Skateboard"];
    [channel setAvatar:@"https://a0.muscache.com/im/pictures/cbf0efb2-eed7-480f-a5a6-1b5d3c5f0d06.jpg"];
    [channel setIdentifier:ide];
    [channel setMessage:@"Hello! I love to travel and make new friends. For almost 10 years, I have been skateboarding and longboarding everywhere I go."];
    
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

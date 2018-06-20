//
//  PNController.m
//  Chatter-iOS
//
//  Created by Carlos Bedoy on 6/13/18.
//  Copyright © 2018 Carlos Bedoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PNController.h"
#import "Buddy.h"
#define PUBLISH_KEY @"pub-c-c4e86432-b754-4913-864a-4ef778860ec0"
#define SUBSCRIPTION_KEY @"sub-c-d3aea19c-4894-11e8-ba5f-36600805f352"
@interface PNController()
@property (nonatomic, strong) id<PNControllerDelegate> delegate;
@end
@implementation PNController

- (instancetype)init
{
    self = [super init];
    if (self) {
        PNConfiguration *configuration = [PNConfiguration configurationWithPublishKey:PUBLISH_KEY subscribeKey:SUBSCRIPTION_KEY];
        
        NSString *identifier = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
        [configuration setUUID:identifier];
        [configuration setStripMobilePayload:NO];
        self.client = [PubNub clientWithConfiguration:configuration];
        [self.client addListener:self];
    }
    return self;
}

- (void)client:(PubNub *)client didReceiveStatus:(PNStatus *)status{
    
}

- (void)client:(PubNub *)client didReceiveMessage:(PNMessageResult *)message{
    // Handle new message stored in message.data.message
    if (![message.data.channel isEqualToString:message.data.subscription]) {
        
        // Message has been received on channel group stored in message.data.subscription.
    }
    else {
        
        // Message has been received on channel stored in message.data.channel.
    }
    
    [self.delegate onReceivedMessage:message.data.message];
    
    NSLog(@"Received message: %@ on channel %@ at %@", message.data.message[@"raw_message"],
          message.data.channel, message.data.timetoken);
}

- (void)client:(PubNub *)client didReceivePresenceEvent:(PNPresenceEventResult *)event{
    if (![event.data.channel isEqualToString:event.data.subscription]) {
        
        // Presence event has been received on channel group stored in event.data.subscription.
    }
    else {
        
        // Presence event has been received on channel stored in event.data.channel.
    }
    
    if (![event.data.presenceEvent isEqualToString:@"state-change"]) {
        
        NSLog(@"%@ \"%@'ed\"\nat: %@ on %@ (Occupancy: %@)", event.data.presence.uuid,
              event.data.presenceEvent, event.data.presence.timetoken, event.data.channel,
              event.data.presence.occupancy);
    }
    else {
        
        NSLog(@"%@ changed state at: %@ on %@ to: %@", event.data.presence.uuid,
              event.data.presence.timetoken, event.data.channel, event.data.presence.state);
    }
}

#pragma PNControllerHandler

- (void)subscribeToChannel:(NSString *)channel withDelegate:(Protocol *)delegate{
  
    [self setDelegate:delegate];
    
    [[self client] subscribeToChannels:[NSArray arrayWithObject:channel] withPresence:YES];
}

- (void)unSubscribeFromChannel:(NSString *)channel withDelegate:(Protocol *)delegate{
    [self setDelegate:nil];

    [[self client] unsubscribeFromChannels:[NSArray arrayWithObject:channel] withPresence:YES];
}

- (void)sendMessage:(NSString *)messageText from:(NSString *)from toChannel:(NSString *)channel withBlock:(PNPublishCompletionBlock)block{
    
    NSArray *buddies = [self.buddiesProvider buddies];
    Buddy *buddy = buddies[arc4random_uniform((int)[buddies count])];
    
    NSMutableDictionary *message = [NSMutableDictionary dictionary];
    message[@"raw_message"] = messageText;
    message[@"uuid"] = [[NSUUID UUID] UUIDString];
    message[@"from"] = from;
    message[@"avatar"] = buddy.avatar;
    message[@"nickname"] = buddy.nickname;
    
    
    [[self client] publish:message toChannel:channel  storeInHistory: YES withCompletion:block];
}

- (void)requestHistoryFromChannel:(NSString *)channel withCallback:(onMessagesReceivedCallback)callback{
    [[self client] historyForChannel:channel withCompletion:^(PNHistoryResult * _Nullable result, PNErrorStatus * _Nullable status) {
        if (callback != nil) {
            NSArray *messages = result.data.messages;
            callback([messages mutableCopy]);
        }
    }];
}

@end

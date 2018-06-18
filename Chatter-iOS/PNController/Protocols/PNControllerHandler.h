//
//  PNControllerHandler.h
//  Chatter-iOS
//
//  Created by Carlos Bedoy on 6/13/18.
//  Copyright © 2018 Carlos Bedoy. All rights reserved.
//
#import <PubNub/PubNub.h>
#import <Foundation/Foundation.h>

@protocol PNControllerHandler <NSObject>

typedef void (^onMessagesReceivedCallback)(NSMutableArray* messages);

- (void)subscribeToChannel:(NSString *)channel;
- (void)unSubscribeFromChannel:(NSString *)channel;
- (void)sendMessage:(NSString *)messageText from:(NSString *)from toChannel:(NSString *)channel withBlock:(PNPublishCompletionBlock)block;

- (void)requestHistoryFromChannel:(NSString *)channel withCallback:(onMessagesReceivedCallback)callback;



@end

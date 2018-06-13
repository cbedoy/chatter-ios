//
//  PNController.h
//  Chatter-iOS
//
//  Created by Carlos Bedoy on 6/13/18.
//  Copyright © 2018 Carlos Bedoy. All rights reserved.
//

#import <PubNub/PubNub.h>
#import <Foundation/Foundation.h>
#import "PNControllerHandler.h"
#import "BudiesProvider.h"
@interface PNController : NSObject<PNObjectEventListener, PNControllerHandler>

// Stores reference on PubNub client to make sure what it won't be released.
@property (nonatomic, strong) PubNub *client;
@property (nonatomic, strong) BudiesProvider *buddiesProvider;

@end

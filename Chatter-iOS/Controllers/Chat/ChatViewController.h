//
//  ChatViewController.h
//  Chatter-iOS
//
//  Created by Carlos Bedoy on 6/18/18.
//  Copyright © 2018 Carlos Bedoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlackTextViewController/SLKTextViewController.h"
#import "Channel.h"
#import "PNControllerHandler.h"
@interface ChatViewController : SLKTextViewController
@property (nonatomic, strong) Channel *channel;
@property (nonatomic, strong) id<PNControllerHandler> pnControllerHandler;
@end

//
//  ChannelsViewController.h
//  Chatter-iOS
//
//  Created by Carlos Bedoy on 6/18/18.
//  Copyright © 2018 Carlos Bedoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTableViewController.h"
#import "ChatViewController.h"
#import "PNControllerHandler.h"
@interface ChannelsViewController : BaseTableViewController

@property (nonatomic, strong) id<PNControllerHandler> pnControllerHandler;
@property (nonatomic, strong) ChatViewController *chatViewController;

@end

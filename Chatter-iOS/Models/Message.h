//
//  Message.h
//  Chatter-iOS
//
//  Created by Carlos Bedoy on 6/18/18.
//  Copyright © 2018 Carlos Bedoy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IModel.h"
#import <UIKit/UIKit.h>
@interface Message : NSObject<IModel>

@property (nonatomic, strong) NSString *uuid;
@property (nonatomic, strong) NSString *rawMessage;
@property (nonatomic, strong) NSString *from;
@property (nonatomic, strong) NSString *nickname;
@property (nonatomic, strong) NSString *avatar;

@end

//
//  Channel.h
//  Chatter-iOS
//
//  Created by Carlos Bedoy on 6/14/18.
//  Copyright © 2018 Carlos Bedoy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IModel.h"
@interface Channel : NSObject<IModel>

@property (nonatomic, strong) NSString *identifier;
@property (nonatomic, strong) NSString *avatar;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *message;



@end

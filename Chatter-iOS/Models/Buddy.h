//
//  Buddy.h
//  Chatter-iOS
//
//  Created by Carlos Bedoy on 6/13/18.
//  Copyright © 2018 Carlos Bedoy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IModel.h"
#import <Realm/Realm.h>
@interface Buddy : RLMObject<IModel>

@property (nonatomic, strong) NSString *identifier;
@property (nonatomic, strong) NSString *nickname;
@property (nonatomic, strong) NSString *avatar;

@end

//
//  Buddy.m
//  Chatter-iOS
//
//  Created by Carlos Bedoy on 6/13/18.
//  Copyright © 2018 Carlos Bedoy. All rights reserved.
//

#import "Buddy.h"

@implementation Buddy

-(NSString *)identifier{
    return _identifier;
}
-(NSInteger)height{
    return 44;
}

+ (NSString *) primaryKey{
    return @"identifier";
}

@end

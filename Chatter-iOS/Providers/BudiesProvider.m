//
//  BudiesProvider.m
//  Chatter-iOS
//
//  Created by Carlos Bedoy on 6/13/18.
//  Copyright © 2018 Carlos Bedoy. All rights reserved.
//

#import "BudiesProvider.h"
#import "Buddy.h"
@interface BudiesProvider()
@property (nonatomic, strong) NSMutableArray *fakeBuddies;
@end
@implementation BudiesProvider

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (NSArray *)fakeBuddies{
    if (_fakeBuddies == nil) {
        _fakeBuddies = [NSMutableArray array];
        
        Buddy *buddy = [Buddy new];
        buddy.nickname = @"Adrizha Bedoy";
        buddy.avatar = @"https://scontent.fcjs3-2.fna.fbcdn.net/v/t1.0-1/p320x320/29543043_10208725552776221_2715178134699285047_n.jpg?_nc_cat=0&oh=957e2cc604a96482c82436d05458feb3&oe=5BBB3F34";
        buddy.identifier = @"adrizha_bedoy";
        
        [_fakeBuddies addObject:buddy];
        
        buddy = [Buddy new];
        buddy.nickname = @"Oliver Hernandez";
        buddy.avatar = @"https://scontent.fcjs3-2.fna.fbcdn.net/v/t1.0-1/p320x320/29497580_10213754228483502_8942732689917328522_n.jpg?_nc_cat=0&oh=81eb759e85b99d0181e3c2307451382b&oe=5B7A3EF2";
        buddy.identifier = @"oliver_hd";
        
        [_fakeBuddies addObject:buddy];
        
        buddy = [Buddy new];
        buddy.nickname = @"Chema Tunes";
        buddy.avatar = @"https://scontent.fcjs3-2.fna.fbcdn.net/v/t1.0-1/p320x320/32187322_10155783636874541_7852041657015861248_n.jpg?_nc_cat=0&oh=97e565c75753ff970e794b12fef956c0&oe=5BB496C8";
        buddy.identifier = @"chema_stuff";
        
        [_fakeBuddies addObject:buddy];
        
        buddy = [Buddy new];
        buddy.nickname = @"Xahnder Helson";
        buddy.avatar = @"https://scontent.fcjs3-2.fna.fbcdn.net/v/t1.0-1/c0.1.320.320/p320x320/22730613_10210769272283690_8483147241067963435_n.jpg?_nc_cat=0&oh=434e640a5f6e530eb8b30a76cc38aa19&oe=5BAAFB5C";
        buddy.identifier = @"xahnder_helson";
        
        [_fakeBuddies addObject:buddy];
        
        
    }
    return _fakeBuddies;
}

- (NSArray *)buddies{
    return self.fakeBuddies;
}


@end

//
//  Message.m
//  Chatter-iOS
//
//  Created by Carlos Bedoy on 6/18/18.
//  Copyright © 2018 Carlos Bedoy. All rights reserved.
//

#import "Message.h"

@implementation Message

-(NSString *)identifier{
    return _uuid;
}
-(NSInteger)height{
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue" size:14]};
    // NSString class method: boundingRectWithSize:options:attributes:context is
    // available only on ios7.0 sdk.
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    width -= 60;
    width -= 16;
    
    CGRect rect = [self.rawMessage boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)
                                              options:NSStringDrawingUsesLineFragmentOrigin
                                           attributes:attributes
                                              context:nil];
    
    return rect.size.height + 18 + 36;
}

+ (NSString *) primaryKey{
    return @"uuid";
}

@end

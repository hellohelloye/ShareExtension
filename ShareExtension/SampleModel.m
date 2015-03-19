//
//  SampleModel.m
//  ShareExtension
//
//  Created by yye on 3/19/15.
//  Copyright (c) 2015 Yukui Ye. All rights reserved.
//

#import "SampleModel.h"

@implementation SampleModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"idTrack": @"id",
             @"userAvatar_url": @"user.avatar_url",
             @"artwork_url": @"artwork_url",
             };
}


@end

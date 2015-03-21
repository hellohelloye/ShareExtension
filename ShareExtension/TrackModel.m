//
//  TrackModel.m
//  ShareExtension
//
//  Created by yye on 3/20/15.
//  Copyright (c) 2015 Yukui Ye. All rights reserved.
//

#import "TrackModel.h"

@implementation TrackModel

- (id)init {
    self = [super init];
    if (self) {
    }
    return self;
}

- (id)initWithSampleModel:(SampleModel *)sampleModel {
    self = [super init];
    if (self) {
        self.user_username = sampleModel.user_username;
        self.artwork_url = [self getIconImg: sampleModel.artwork_url];
        self.user_avatar_url = [self getIconImg: sampleModel.user_avatar_url];
        self.track_id = sampleModel.id;
    }
    return self;
}

- (NSString *)getIconImg:(NSString *)iconImgUrl {
    NSRange startRange = [iconImgUrl rangeOfString:@".com/"];
    
    NSRange searchRange = NSMakeRange(startRange.location + startRange.length, iconImgUrl.length - startRange.length - startRange.location);
    return [NSString stringWithString :[iconImgUrl substringWithRange:searchRange]];
}

@end

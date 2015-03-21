//
//  TrackModel.h
//  ShareExtension
//
//  Created by yye on 3/20/15.
//  Copyright (c) 2015 Yukui Ye. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SampleModel.h"
@class  SampleModel;

@interface TrackModel : NSObject
@property (nonatomic, strong) NSString *artwork_url;
@property (nonatomic, strong) NSString *user_username;
@property (nonatomic, strong) NSString *user_avatar_url;

- (id)initWithSampleModel:(SampleModel *)sampleModel;
@end

//
//  ServiceManager.h
//  ShareExtension
//
//  Created by yye on 3/19/15.
//  Copyright (c) 2015 Yukui Ye. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "SampleModel.h"
#import "TrackModel.h"

@interface ServiceManager : NSObject

+ (instancetype)sharedSingleton;
@property (nonatomic, strong) NSArray *arrayModelData;
@property (nonatomic, strong) NSArray *trackArray;;

- (RACSignal *)fetchJSONFromURL:(NSURL *)url;
- (RACSignal *)fetchSpecificJsonDataToModel:(NSString *)permalink;
- (RACSignal *)updateDataFromURL:(NSString *)permalink;
@end

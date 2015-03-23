//
//  ServiceManager.m
//  ShareExtension
//
//  Created by yye on 3/19/15.
//  Copyright (c) 2015 Yukui Ye. All rights reserved.
//

#import "ServiceManager.h"

@interface ServiceManager() <NSURLSessionDataDelegate>
@property (nonatomic, strong) NSURLSession *session;
@end

@implementation ServiceManager

+ (instancetype)sharedSingleton {
    static ServiceManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ServiceManager alloc] init];
    });
    return sharedInstance;
}

- (id) init {
    self = [super init];
    if (self) {
        self.session = [NSURLSession sharedSession];
    }
    return self;
}

- (RACSignal *)fetchJSONFromURL: (NSURL *)url {
    return [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSURLSessionDataTask *dataTask = [self.session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            if (! error) {
                NSError *jsonError = nil;
                id json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&jsonError];
                if (!jsonError) {
                    [subscriber sendNext:json];
                } else {
                    [subscriber sendError:jsonError];
                }
            } else {
                [subscriber sendError:error];
            }
            [subscriber sendCompleted];
        }];
        
        [dataTask resume];
        
        return [RACDisposable disposableWithBlock:^{
            [dataTask cancel];
        }];
        
    }] doError:^(NSError *error) {
        NSLog(@"Error: %@",error);
    }];
}

//testing sample track link
- (RACSignal *)fetchSpecificJsonDataToModel: (NSString *)permalink {
    return [[self fetchJSONFromURL: [NSURL URLWithString:@"https://api.soundcloud.com/users/3399796/tracks.json?client_id=090d817d0884669e83f49198015105ef"]] map:^(NSDictionary *json) {
        RACSequence *list = [json rac_sequence];
        return [[list map:^(NSDictionary *item) {
            return [MTLJSONAdapter modelOfClass:[SampleModel class] fromJSONDictionary:item error:nil];
        }] array];
    }];
}

///////// testing model
- (RACSignal *)updateDataFromURL: (NSString *)permalink {
    return [[self fetchSpecificJsonDataToModel:permalink] subscribeNext:^(NSArray *arrayFromURLdata) {
        self.arrayModelData = arrayFromURLdata;
        NSMutableArray *arrayHelper = [[NSMutableArray alloc] init];
        for (int i = 0; i <= 8; i++) {
            [arrayHelper addObject:[[TrackModel alloc] initWithSampleModel:self.arrayModelData[i]]];
        }
        self.trackArray = [arrayHelper copy];
    }];
}

//generic permalink generate track infos
//- (RACSignal *)fetchSpecificJsonDataToModel: (NSString *)permalink {
//    return [[self fetchJSONFromURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://api.soundcloud.com/resolve.json?url=%@&client_id=df5d294f55d41469a70fc50c8b7040a4",permalink]]] map:^(NSDictionary *userInfoDictionary) {
//        return [[self fetchJSONFromURL: [NSURL URLWithString:[NSString stringWithFormat:@"https://api.soundcloud.com/users/%@/tracks.json?client_id=090d817d0884669e83f49198015105ef", [userInfoDictionary valueForKey:@"id"]]]] map:^(NSDictionary *json) {
//            RACSequence *list = [json rac_sequence];
//            return [[list map:^(NSDictionary *item) {
//                return [MTLJSONAdapter modelOfClass:[SampleModel class] fromJSONDictionary:item error:nil];
//            }] array];
//        }];
//    }];
//}

@end
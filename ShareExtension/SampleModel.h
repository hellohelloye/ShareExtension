//
//  SampleModel.h
//  ShareExtension
//
//  Created by yye on 3/19/15.
//  Copyright (c) 2015 Yukui Ye. All rights reserved.
//

#import "MTLModel.h"
#import <Mantle/Mantle.h>

@interface SampleModel : MTLModel

@property (nonatomic, strong) NSString *idTrack;
@property (nonatomic, strong) NSString *userAvatar_url;
@property (nonatomic, strong) NSString *artwork_url;

@end


//   "id": 196345786,
// "artwork_url": "https://i1.sndcdn.com/artworks-000110346925-st4lev-large.jpg",
//
//"user": {
//    "id": 3399796,
//    "kind": "user",
//    "permalink": "mrsuicidesheep",
//    "username": "MrSuicideSheep",
//    "last_modified": "2015/03/18 18:53:50 +0000",
//    "uri": "https://api.soundcloud.com/users/3399796",
//    "permalink_url": "http://soundcloud.com/mrsuicidesheep",
//    "avatar_url": "https://i1.sndcdn.com/avatars-000131887198-iugjwb-large.jpg"
//},
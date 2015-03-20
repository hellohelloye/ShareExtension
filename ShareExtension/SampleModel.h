//
//  SampleModel.h
//  ShareExtension
//
//  Created by yye on 3/19/15.
//  Copyright (c) 2015 Yukui Ye. All rights reserved.
//

#import "MTLModel.h"
#import <Mantle/Mantle.h>

@interface SampleModel : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) NSString *artwork_url;
@property (nonatomic, strong) NSString *attachments_uri;
@property (nonatomic, strong) NSString *bpm;
@property (nonatomic, strong) NSString *comment_count;
@property (nonatomic, strong) NSString *commentable;
@property (nonatomic, strong) NSString *created_at;
@property (nonatomic, strong) NSString *description_sd;
@property (nonatomic, strong) NSString *download_count;
@property (nonatomic, strong) NSString *downloadable;
@property (nonatomic, strong) NSString *duration;
@property (nonatomic, strong) NSString *embeddable_by;
@property (nonatomic, strong) NSString *favoritings_count;
@property (nonatomic, strong) NSString *genre;
@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) NSString *isrc;
@property (nonatomic, strong) NSString *key_signature;
@property (nonatomic, strong) NSString *kind;
@property (nonatomic, strong) NSString *label_id;
@property (nonatomic, strong) NSString *label_name;
@property (nonatomic, strong) NSString *last_modified;
@property (nonatomic, strong) NSString *license;
@property (nonatomic, strong) NSString *original_content_size;
@property (nonatomic, strong) NSString *original_format;
@property (nonatomic, strong) NSString *permalink ;
@property (nonatomic, strong) NSString *permalink_url;
@property (nonatomic, strong) NSString *playback_count;
@property (nonatomic, strong) NSString *policy ;
@property (nonatomic, strong) NSString *purchase_title;
@property (nonatomic, strong) NSString *purchase_url;
@property (nonatomic, strong) NSString *releaseData;
@property (nonatomic, strong) NSString *release_day;
@property (nonatomic, strong) NSString *release_month;
@property (nonatomic, strong) NSString *release_year ;
@property (nonatomic, strong) NSString *sharing;
@property (nonatomic, strong) NSString *state;
@property (nonatomic, strong) NSString *stream_url;
@property (nonatomic, strong) NSString *streamable;
@property (nonatomic, strong) NSString *tag_list;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *track_type;
@property (nonatomic, strong) NSString *uri;

@property (nonatomic, strong) NSString *user_avatar_url ;
@property (nonatomic, strong) NSString *userid;
@property (nonatomic, strong) NSString *user_kind;
@property (nonatomic, strong) NSString *user_last_modified;
@property (nonatomic, strong) NSString *user_permalink;
@property (nonatomic, strong) NSString *user_permalink_url;
@property (nonatomic, strong) NSString *user_uri;
@property (nonatomic, strong) NSString *user_username;

@property (nonatomic, strong) NSString *user_id ;
@property (nonatomic, strong) NSString *video_url;
@property (nonatomic, strong) NSString *waveform_url;

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
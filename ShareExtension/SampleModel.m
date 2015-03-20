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
             @"artwork_url": @"artwork_url",
             @"attachments_uri": @"attachments_uri",
             @"bpm": @"bpm",
             @"comment_count":@"comment_count",
             @"commentable": @"commentable",
             @"created_at": @"created_at",
             @"description_sd": @"description",
             @"download_count":@"download_count",
             @"downloadable": @"downloadable",
             @"duration": @"duration",
             @"embeddable_by": @"embeddable_by",
             @"favoritings_count":@"favoritings_count",
             @"genre": @"genre",
             @"id": @"id",
             @"isrc": @"isrc",
             @"key_signature":@"key_signature",
             @"kind": @"kind",
             @"label_id": @"label_id",
             @"label_name": @"label_name",
             @"last_modified":@"last_modified",
             @"license": @"license",
             @"original_content_size": @"original_content_size",
             @"original_format": @"original_format",
             @"permalink":@"permalink",
             @"permalink_url": @"permalink_url",
             @"playback_count": @"playback_count",
             @"policy": @"policy",
             @"purchase_title":@"purchase_title",
             @"purchase_url": @"purchase_url",
             @"releaseData": @"releaseData",
             @"release_day": @"release_day",
             @"release_month":@"release_month",
             @"release_year": @"release_year",
             @"sharing": @"sharing",
             @"state": @"state",
             @"stream_url":@"stream_url",
             @"streamable": @"streamable",
             @"tag_list": @"tag_list",
             @"title": @"title",
             @"track_type":@"track_type",
             @"uri":@"uri",
             @"user_avatar_url": @"user.avatar_url",
             @"userid": @"user.id",
             @"user_kind": @"user.kind",
             @"user_last_modified":@"user.last_modified",
             @"user_permalink": @"user.permalink",
             @"user_permalink_url": @"user.permalink_url",
             @"user_uri": @"user.uri",
             @"user_username":@"user.username",
             @"user_id": @"user_id",
             @"video_url": @"video_url",
             @"waveform_url": @"waveform_url",
             };
}


@end

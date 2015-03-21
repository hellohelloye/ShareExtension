//
//  Card.h
//  ShareExtension
//
//  Created by yye on 3/20/15.
//  Copyright (c) 2015 Yukui Ye. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Card : UICollectionViewCell

@property (strong, nonatomic) NSString *id;
@property (strong, nonatomic) IBOutlet UIButton *cardBtn;

@end

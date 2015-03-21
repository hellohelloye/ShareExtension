//
//  ViewController.m
//  ShareExtension
//
//  Created by yye on 3/18/15.
//  Copyright (c) 2015 Yukui Ye. All rights reserved.
//

#import "ViewController.h"
#import "ServiceManager.h"
#import "Card.h"

@interface ViewController ()
@property (strong, nonatomic) NSArray *cardArray;
@property (nonatomic) NSInteger flipCnt;
@property (strong, nonatomic) Card *oldCard;
@property (nonatomic) NSInteger cardViewCVCnt;
@end

@implementation ViewController

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(userDefaultsDidChange:)
                                                     name:NSUserDefaultsDidChangeNotification
                                                   object:nil];
    }
    return self;
}

- (void)userDefaultsDidChange:(NSNotification *)notification {
    [self updateShareContent];
}

- (void)updateShareContent {
    NSUserDefaults *sharedDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.shareExtension.YE"];
    NSString *sharedText = [sharedDefaults objectForKey:@"stringKey"];
    
    NSLog(@"shared context: %@", sharedText);//purpuse: to get current user's permalink from shareAction inside soundCloud app.  between string "by" - "on"
    //parse string...
    [[ServiceManager sharedSingleton] updateDataFromURL:sharedText];
    self.cardArray = [[ServiceManager sharedSingleton] trackArray];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.flipCnt = 0;
    self.cardViewCVCnt = 8;
    [self updateShareContent];
//    @weakify(self)
//    [[[self rac_signalForSelector:@selector(updateShareContent)
//                   fromProtocol:@protocol(UICollectionViewDelegate)]
//     map:^id(RACTuple *tuple) {
//        return tuple.second;
//    }] subscribeNext:^(id x) {
//        [self.cardPlaygroundCV reloadData];
//    }];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    return self.cardViewCVCnt;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    Card *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PlayingCard" forIndexPath:indexPath];
    TrackModel *track = self.cardArray[indexPath.row];
    cell.id = track.track_id;
    if (cell.cardBtn.selected == NO) {
        [cell.cardBtn setBackgroundImage:[UIImage imageNamed:track.user_avatar_url] forState:UIControlStateNormal];
    } else {
        [cell.cardBtn setBackgroundImage:[UIImage imageNamed:track.artwork_url] forState:UIControlStateNormal];
    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.flipCnt < 2) {
        self.flipCnt += 1;
    }
    Card *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PlayingCard" forIndexPath:indexPath];
    if (!self.cardArray) {
        TrackModel *track = self.cardArray[indexPath.row];
        if (cell.cardBtn.selected == NO) {
            [cell.cardBtn setBackgroundImage:[UIImage imageNamed:track.user_avatar_url] forState:UIControlStateNormal];
            cell.cardBtn.selected = YES;
        } else {
            [cell.cardBtn setBackgroundImage:[UIImage imageNamed:track.artwork_url] forState:UIControlStateNormal];
            cell.cardBtn.selected = NO;
            if (self.flipCnt == 1) {
                [self updateUI:cell];
            } else {
                self.oldCard = cell;
            }
        }
    }
}

- (void)updateUI:(Card *)cell {
    if (self.oldCard.id == cell.id) {
        self.cardViewCVCnt -= 2;
        [self.cardPlaygroundCV reloadData];
    } else {
        self.flipCnt = 0;
    }
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake(80, 80);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end

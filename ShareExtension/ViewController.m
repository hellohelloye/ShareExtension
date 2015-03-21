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

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
    return 8;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    Card *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PlayingCard" forIndexPath:indexPath];
    [RACObserve(self, cardArray) subscribeNext:^(NSArray *cardArray) {
        TrackModel *track = self.cardArray[indexPath.row];
        if (cell.cardBtn.selected == NO) {
            [cell.cardBtn setBackgroundImage:[UIImage imageNamed:track.user_avatar_url] forState:UIControlStateNormal];
        }
        
       
    }];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    Card *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PlayingCard" forIndexPath:indexPath];
    if (!self.cardArray) {
        TrackModel *track = self.cardArray[indexPath.row];
        [cell.cardBtn setBackgroundImage:[UIImage imageNamed:track.artwork_url] forState:UIControlStateNormal];
        cell.cardBtn.selected = NO;
    }
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
//    Card *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PlayingCard" forIndexPath:indexPath];
//    cell.cardBtn.selected = YES;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) return CGSizeMake(80, 80);
    if (indexPath.row == 1) return CGSizeMake(80, 80);
    if (indexPath.row == 2) return CGSizeMake(80, 80);
    if (indexPath.row == 3) return CGSizeMake(80, 80);
    if (indexPath.row == 4) return CGSizeMake(80, 80);
    if (indexPath.row == 5) return CGSizeMake(80, 80);
    if (indexPath.row == 6) return CGSizeMake(80, 80);
    if (indexPath.row == 7) return CGSizeMake(80, 80);
    
    return CGSizeZero;
}

- (void)clickCard:(UIImage *)img {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end

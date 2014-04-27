//
//  ClosetViewController.h
//  Kameleon
//
//  Created by Brian Butterfied on 4/7/14.
//  Copyright (c) 2014 Kameleon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClosetViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>
{
    NSString * url;
    NSMutableArray * fileArray;
}
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;


@end

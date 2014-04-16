//
//  ClosetViewController.m
//  Kameleon
//
//  Created by Brian Butterfied on 4/7/14.
//  Copyright (c) 2014 Kameleon. All rights reserved.
//

#import "ClosetViewController.h"
#import "AsyncImageDownloader.h"

@interface ClosetViewController ()

@end

@implementation ClosetViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    array = [[NSMutableArray alloc] init];
    
//    [array addObject:@"Pic1"];
//    [array addObject:@"Pic2"];
//    [array addObject:@"Pic3"];
//    [array addObject:@"Pic4"];
//    [array addObject:@"Pic5"];
    
    [array addObject:@"http://ecx.images-amazon.com/images/I/412MUPEU2QL.jpg"];
    [array addObject:@"http://ecx.images-amazon.com/images/I/51nJDARRjRL.jpg"];
    [array addObject:@"http://ecx.images-amazon.com/images/I/518ZhCT%2BHlL.jpg"];
    [array addObject:@"http://ecx.images-amazon.com/images/I/41ScNjKSvVL.jpg"];
    [array addObject:@"http://ecx.images-amazon.com/images/I/41KHf2LuxeL.jpg"];
    [array addObject:@"http://ecx.images-amazon.com/images/I/41yO1qM6xtL.jpg"];
    [array addObject:@"http://ecx.images-amazon.com/images/I/41wbox4ULzL.jpg"];
    [array addObject:@"http://ecx.images-amazon.com/images/I/41Bm27iHkTL.jpg"];
    [array addObject:@"http://ecx.images-amazon.com/images/I/31mFyjqmErL.jpg"];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark Collection View Methods
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [array count];
//    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ImageCell" forIndexPath:indexPath];
    
//    UILabel *label = (UILabel *)[cell viewWithTag:101];
//    label.text = [array objectAtIndex:indexPath.row];
//    
//    [cell.layer setBorderWidth:2.0f];
//    [cell.layer setBorderColor:[UIColor whiteColor].CGColor];
//    
//    [cell.layer setCornerRadius:50.0f];
//    
//    
    
    
    //UIImageView *myImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 120, 120)];
    
    UIImageView *myImageView = (UIImageView *)[cell viewWithTag:102];
	
    [[[AsyncImageDownloader alloc] initWithMediaURL:[array objectAtIndex:indexPath.row]
    successBlock:^(UIImage *image)
    {
        [myImageView setImage:image];
    }
    failBlock:^(NSError *error)
    {
        NSLog(@"Failed to download image due to %@!", error);
    }]
     startDownload];
    
    return cell;
}

@end

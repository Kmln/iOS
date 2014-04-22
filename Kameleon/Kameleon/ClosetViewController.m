//
//  ClosetViewController.m
//  Kameleon
//
//  Created by Brian Butterfied on 4/7/14.
//  Copyright (c) 2014 Kameleon. All rights reserved.
//

#import "ClosetViewController.h"
#import "AsyncImageDownloader.h"
#import "UIImage+Resize.h"

@interface ClosetViewController ()

@end

@implementation ClosetViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    url = @"http://ecx.images-amazon.com/images/I/";
    
    fileArray = [[NSMutableArray alloc] init];
    
    [fileArray addObject:[url stringByAppendingString:@"412MUPEU2QL.jpg"]];
    [fileArray addObject:[url stringByAppendingString:@"51nJDARRjRL.jpg"]];
    [fileArray addObject:[url stringByAppendingString:@"518ZhCT%2BHlL.jpg"]];
    [fileArray addObject:[url stringByAppendingString:@"41ScNjKSvVL.jpg"]];
    [fileArray addObject:[url stringByAppendingString:@"41KHf2LuxeL.jpg"]];
    [fileArray addObject:[url stringByAppendingString:@"41yO1qM6xtL.jpg"]];
    [fileArray addObject:[url stringByAppendingString:@"41wbox4ULzL.jpg"]];
    [fileArray addObject:[url stringByAppendingString:@"41Bm27iHkTL.jpg"]];
    [fileArray addObject:[url stringByAppendingString:@"31mFyjqmErL.jpg"]];
    
    dictionayImages = [[NSMutableDictionary alloc] init];
    
    for (int i = 0; i < fileArray.count; i++)
    {
        [[[AsyncImageDownloader alloc] initWithMediaURL:[fileArray objectAtIndex:i]
          successBlock:^(UIImage *image)
          {
              CGSize imageSize = CGSizeMake(image.size.width * 0.8f, image.size.height * 0.8f);
              UIImage * resizedImage = [image resizedImageToSize:imageSize];
              [dictionayImages setObject:resizedImage forKey:[NSNumber numberWithInt:i]];
              
              //[self.collectionView reloadItemsAtIndexPaths:self.collectionView.indexPathsForVisibleItems];
              [self.collectionView reloadData];
              
          }
          failBlock:^(NSError *error)
          {
              NSLog(@"Failed to download image due to %@!", error);
          }
          ] startDownload];
    }


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
    return [fileArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ImageCell" forIndexPath:indexPath];
    
    UIImageView *myImageView = (UIImageView *)[cell viewWithTag:102];
    
    
	[myImageView setImage:[dictionayImages objectForKey:[NSNumber numberWithInt:indexPath.row]]];
    [myImageView sizeToFit];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{

    UIImage *image = [dictionayImages objectForKey:[NSNumber numberWithInt:indexPath.row]];
    
    return image.size;
}

@end

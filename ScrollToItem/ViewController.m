//
//  ViewController.m
//  ScrollToItem
//
//  Created by Viktor Kucera on 11/3/14.
//  Copyright (c) 2014 Viktor Kucera. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"

@interface ViewController ()

- (IBAction)nextCell:(id)sender;
- (IBAction)prevCell:(id)sender;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
    return 100;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TestCell" forIndexPath:indexPath];
    
    [cell.numberLbl setText:[NSString stringWithFormat:@"%zd",indexPath.row]];
    
    return cell;
}

- (IBAction)nextCell:(id)sender
{
    NSArray *visibleItems = [self.collectionView indexPathsForVisibleItems];
    NSIndexPath *currentItem = [visibleItems objectAtIndex:0];
    
    NSIndexPath *prevIndexPath = [NSIndexPath indexPathForItem:(currentItem.item + 1) inSection:currentItem.section];
    [self.collectionView scrollToItemAtIndexPath:prevIndexPath atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
}

- (IBAction)prevCell:(id)sender
{
    NSArray *visibleItems = [self.collectionView indexPathsForVisibleItems];
    NSIndexPath *currentItem = [visibleItems objectAtIndex:0];
    
    NSIndexPath *prevIndexPath = [NSIndexPath indexPathForItem:(currentItem.item - 1) inSection:currentItem.section];
    [self.collectionView scrollToItemAtIndexPath:prevIndexPath atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
}
@end

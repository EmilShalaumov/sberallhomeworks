//
//  ViewController.m
//  HomeWork1
//
//  Created by Эмиль Шалаумов on 26/09/2019.
//  Copyright © 2019 Emil Shalaumov. All rights reserved.
//

#import "ViewController.h"
#import "ISSQuickSort.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 1 - operations with array of numbers
    [self operationsWithArrayOfNumbers];
    
    // 2 - operations with array of strings
    [self operationsWithArrayOfStrings];
}

- (void)operationsWithArrayOfNumbers
{
    NSMutableArray *sourceArray = [NSMutableArray arrayWithObjects: @3, @6, @32, @24, @31, nil];
    
    // 1.1 - array sorting
    NSArray *sortedArray = [ISSQuickSort quickSortArray:sourceArray withOrdering:@"asc"];
    NSLog(@"Sorted array: \n%@", sortedArray);
    
    // 1.2 - array with numbers with value more that 20
    NSMutableArray *arrayMoreThanTwenty = [NSMutableArray array];
    for(NSNumber *element in sourceArray)
    {
        if ([element intValue] > 20)
        {
            [arrayMoreThanTwenty addObject:element];
        }
    }
    NSLog(@"Array with numbers more than 20: %@", arrayMoreThanTwenty);
    
    // 1.3 - array with numbers divisible by three
    NSMutableArray *arrayWithThreeDivNumbers = [NSMutableArray array];
    for (NSNumber *element in sourceArray)
    {
        if (([element intValue] % 3) == 0)
        {
            [arrayWithThreeDivNumbers addObject:element];
        }
    }
    NSLog(@"Array with numbers divisible by three: \n%@", arrayWithThreeDivNumbers);
    
    // 1.4 - add this array to source array
    [sourceArray addObjectsFromArray:arrayWithThreeDivNumbers];
    NSLog(@"Source array with added array from previous task: \n%@", sourceArray);
    
    // 1.5 - descendant sorting
    NSLog(@"Updated and sorted descendantly source array: \n%@", [ISSQuickSort quickSortArray:sourceArray withOrdering:@"desc"]);
}

- (void)operationsWithArrayOfStrings
{
    NSArray *sourceArray = @[
                             @"cataclism",
                             @"catepillar",
                             @"cat",
                             @"teapot",
                             @"truncate"];
    
    // 2.1 - array filter by "cat" prefix
    NSMutableArray *filteredArray = [NSMutableArray array];
    for(NSString *element in sourceArray)
    {
        if ([element hasPrefix:@"cat"])
        {
            [filteredArray addObject:element];
        }
    }
    
    // 2.2 - printing of filtered array
    NSLog(@"Filtered array: \n%@", filteredArray);
    
    // 2.3 - dictionary from array
    NSMutableDictionary *charCountsDict = [NSMutableDictionary dictionary];
    for (NSString *element in filteredArray)
    {
        [charCountsDict setObject:[NSNumber numberWithUnsignedInteger:element.length] forKey:element];
    }
    NSLog(@"Dictionary of strings and numbers of characters: \n%@", charCountsDict);
}

@end

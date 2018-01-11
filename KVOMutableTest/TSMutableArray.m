//
//  TSMutableArray.m
//  KVOMutableTest
//
//  Created by minor on 2018/1/5.
//  Copyright © 2018年 Hotel. All rights reserved.
//

#import "TSMutableArray.h"

@interface TSMutableArray ()

@end

@implementation TSMutableArray

- (instancetype)init
{
    self = [super init];
    if (self) {
        _items = [NSMutableArray new];
    }
    return self;
}

- (void)insertItems:(NSArray *)array atIndexes:(NSIndexSet *)indexes
{
    NSMutableArray *innerArray = [self itemsArray];
    [innerArray insertObjects:array atIndexes:indexes];
}

- (void)insertObject:(id )object inItemsAtIndex:(NSUInteger)index
{
    [[self itemsArray] insertObject:object atIndex:index];
}

- (void)addItems:(NSArray *)objects
{
    [[self itemsArray] addObjectsFromArray:objects];
}

// 还不能写成getter方法，貌似一直在取getter，不知道为啥
// 一定要用mutableArrayValueForKey来访问items
- (NSMutableArray *)itemsArray
{
    return [self mutableArrayValueForKey:NSStringFromSelector(@selector(items))];
}

@end

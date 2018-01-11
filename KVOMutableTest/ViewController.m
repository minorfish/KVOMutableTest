//
//  ViewController.m
//  KVOMutableTest
//
//  Created by minor on 2018/1/5.
//  Copyright © 2018年 Hotel. All rights reserved.
//

#import "ViewController.h"
#import "TSMutableArray.h"

@interface ViewController ()

@property (nonatomic) TSMutableArray *array;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *item1 = @"itemA";
    NSString *item2 = @"itemB";
    NSString *item3 = @"itemC";
    NSArray *items = @[item1, item2, item3];
    self.array = [[TSMutableArray alloc] init];
     [self.array addObserver:self forKeyPath:@"items" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:NULL];
     NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0,items.count)];
    [self.array insertItems:items atIndexes:indexSet];
    [self.array addItems:items];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:@"items"]) {
        NSNumber *kind = change[NSKeyValueChangeKindKey];
        NSArray *students = change[NSKeyValueChangeNewKey];
        NSArray *oldStudent = change[NSKeyValueChangeOldKey];
        NSIndexSet *changedIndexs = change[NSKeyValueChangeIndexesKey];
        
        NSLog(@"kind: %@, item: %@, oldItem: %@, changedIndexs: %@", kind, students, oldStudent, changedIndexs);
    }
}

- (void)dealloc
{
    [self removeObserver:self forKeyPath:@"items" context:NULL];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

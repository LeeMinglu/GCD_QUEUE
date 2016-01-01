//
//  ViewController.m
//  GCD_QUEUE
//
//  Created by 李明禄 on 16/1/1.
//  Copyright © 2016年 SocererGroup. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self demo1];
}


//同步串行队列
- (void)demo1 {
    dispatch_queue_t queue = dispatch_queue_create("socerer_queue", DISPATCH_QUEUE_SERIAL);
    
    for (int i = 0; i < 10; i ++) {
        dispatch_sync(queue, ^{
            NSLog(@"%@...for %d", [NSThread currentThread], i);
        });
        
        NSLog(@"-----%d", i);

    }
    
    NSLog(@"come here");
    
   }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

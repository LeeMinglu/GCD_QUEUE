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
    
//    [self demo1];
//    [self demo2];
//    [self demo3];
    
    [self demo4];
}

//主队列同步，会造成死锁
- (void)demo4 {
    
    NSLog(@"start");
    dispatch_queue_t queue = dispatch_get_main_queue();
    
    // 主线程&主队列相互等待，造成死锁！
    dispatch_sync(queue, ^{
        NSLog(@"%@", [NSThread currentThread]);
    });
    NSLog(@"come here");
}


//并发队列异步执行

- (void)demo3 {
    dispatch_queue_t queue = dispatch_queue_create("socerer.luoriver", DISPATCH_QUEUE_CONCURRENT);
    
    for (int i = 0 ; i < 100; i++) {
        dispatch_async(queue, ^{
            NSLog(@"%@ ....%d",[NSThread currentThread], i);
        });
        
//        NSLog(@"for  ..%d", i);
    }
    
    NSLog(@"come here");
}


//异步串行队列
//会开启一条线程顺序执行
- (void)demo2 {
    dispatch_queue_t queue = dispatch_queue_create("socerer_queue", DISPATCH_QUEUE_SERIAL);
    
    for (int i = 0; i < 10; i ++) {
        dispatch_async(queue, ^{
            NSLog(@"%@...for %d", [NSThread currentThread], i);
        });
        
        NSLog(@"-----%d", i);
        
    }
    
    NSLog(@"come here");
    
}



//同步串行队列
//不会开线程
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

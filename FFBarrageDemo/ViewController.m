//
//  ViewController.m
//  FFBarrageDemo
//
//  Created by Fan on 16/10/31.
//  Copyright © 2016年 Fan. All rights reserved.
//

#import "ViewController.h"
#import "FFBarrageManager.h"
#import "FFBarrageView.h"

@interface ViewController ()
@property(nonatomic, strong) FFBarrageManager *manager;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"弹幕";
    _manager = [[FFBarrageManager alloc] initWithComments:@[@"弹幕1~~~~~~~~~~~~~~", @"弹幕2~~~~~~~~~~~~~~~~~~", @"弹幕3~~~~~~~~~~~~~~~~~~~~~~~~",
                                                            @"弹幕4~~~~~~~~~~~~~", @"弹幕5~~~~~~~~~~~~~~~~~~", @"弹幕6~~~~~~~~~~~~~~~~~~",
                                                            @"弹幕7~~~~~~~~~~~~", @"弹幕8~~~~~~~~~~~~~~~~~~~~~~~~", @"弹幕9~~~~~~~~~~~"]];
    __weak typeof (self) weakSelf = self;
    _manager.trajectoryCount = 5;
    _manager.generateViewBlock = ^(FFBarrageView *barrageView){
        barrageView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width, barrageView.trajectory * 50 + 100, barrageView.frame.size.width, 30);
        [weakSelf.view addSubview:barrageView];
        
        [barrageView startAnimation];
    };
}

- (IBAction)startBarrage:(id)sender {
    
    [_manager start];
}

- (IBAction)stopBarrage:(id)sender {
    [_manager stop];
}

- (IBAction)append:(id)sender {
    
    NSMutableArray *array = [NSMutableArray array];
    for (int i=0; i<10; i++) {
        int value = arc4random()%1000;
        [array addObject:[NSString stringWithFormat:@"弹幕%d~~~~~~~~~~", value]];
    }
    
    [_manager appendData:array];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

//
//  ThirdViewController.h
//  basic exercise
//
//  Created by cocoa on 2017/6/16.
//  Copyright © 2017年 wangbingyan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MyDelegate

- (void)print;

@end

@interface ThirdViewController : UIViewController

@property(weak,nonatomic) id<MyDelegate> delegate;

@end

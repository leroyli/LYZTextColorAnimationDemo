//
//  LYZFickerLabel.h
//  LYZTextColorAnimationDemo
//
//  Created by artios on 2017/4/27.
//  Copyright © 2017年 artios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LYZFickerLabel : UILabel

@property (nonatomic, assign) CGFloat flickeringGap; // default is 0.05. Max is 1.0. Min is 0.0

@property (nonatomic, assign) CGFloat flickeringAnimationDuration; // default is 2.0

@end

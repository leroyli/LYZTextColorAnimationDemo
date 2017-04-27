//
//  ViewController.m
//  LYZTextColorAnimationDemo
//
//  Created by artios on 2017/4/27.
//  Copyright © 2017年 artios. All rights reserved.
//

#import "ViewController.h"
#import "LYZFickerLabel.h"

@interface ViewController ()

@property (nonatomic, strong) CAGradientLayer *gradientLayer;

@property (nonatomic, assign) CGFloat flickeringGap;

@property (nonatomic, assign) CGFloat flickeringAnimationDuration;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    [self configViews];
    
    //    [self setupViews];
    
    [self lyz_setupFickerLabel];
}

- (void)setupViews{
    
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:25.0f];
    label.text = @"the label text colors animation";
    [label sizeToFit];
    label.center = CGPointMake(200, 200);
    [self.view addSubview:label];
    
    _gradientLayer = [CAGradientLayer layer];
    _gradientLayer.frame = label.frame;
    _gradientLayer.colors = @[(__bridge id)[self randomColor].CGColor,(__bridge id)[self randomColor].CGColor,(__bridge id)[self randomColor].CGColor,];
    _gradientLayer.startPoint = CGPointMake(0, 0);
    _gradientLayer.endPoint   = CGPointMake(1, 0);
    
    _gradientLayer.mask = label.layer;
    label.frame = _gradientLayer.bounds;
    
    [self.view.layer addSublayer:_gradientLayer];
    
    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(textColorChange) userInfo:nil repeats:YES];
    
}

- (void)configViews{
    
    self.view.backgroundColor = [UIColor blackColor];
    
    _flickeringGap               = 0.05f;
    _flickeringAnimationDuration = 2.0f;
    
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:25.0f];
    label.text = @"the label text colors animation";
    label.textColor = [UIColor redColor];
    [label sizeToFit];
    label.center = CGPointMake(200, 200);
    
    
    _gradientLayer = [CAGradientLayer layer];
    _gradientLayer.frame = label.bounds;
    _gradientLayer.colors = @[(__bridge id)[[UIColor whiteColor] colorWithAlphaComponent:0.5].CGColor,
                              (__bridge id)[UIColor whiteColor].CGColor,
                              (__bridge id)[[UIColor clearColor] colorWithAlphaComponent:0.5].CGColor];
    
    _gradientLayer.locations = @[@(0), @(_flickeringGap), @(_flickeringGap*2)];
    
    _gradientLayer.startPoint = CGPointMake(0, 0);
    _gradientLayer.endPoint   = CGPointMake(1, 0);
    
    label.layer.mask = _gradientLayer;
    
    [self.view addSubview:label];
    
    [self doAnimation];
    
}

- (void)doAnimation {
    [_gradientLayer removeAnimationForKey:@"slide"];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"locations"];
    animation.fromValue = @[@(0), @(_flickeringGap), @(_flickeringGap*2)];
    animation.toValue   = @[@(1-_flickeringGap*2), @(1-_flickeringGap), @(1)];
    animation.duration  = _flickeringAnimationDuration;
    animation.removedOnCompletion = YES;
    animation.repeatCount = MAXFLOAT;
    [_gradientLayer addAnimation:animation forKey:@"slide"];
}

- (UIColor *)randomColor{
    CGFloat r = arc4random_uniform(256) / 255.0;
    CGFloat g = arc4random_uniform(256) / 255.0;
    CGFloat b = arc4random_uniform(256) / 255.0;
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}

- (void)textColorChange {
    _gradientLayer.colors = @[(id)[self randomColor].CGColor,
                              (id)[self randomColor].CGColor,
                              (id)[self randomColor].CGColor,
                              (id)[self randomColor].CGColor,
                              (id)[self randomColor].CGColor];
}




- (void)lyz_setupFickerLabel{
    
    self.view.backgroundColor = [UIColor blackColor];
    
    LYZFickerLabel *label = [[LYZFickerLabel alloc] init];
    label.text = @"the label colors animation";
    label.font = [UIFont systemFontOfSize:23.0f];
    label.textColor = [UIColor redColor];
    [label sizeToFit];
    label.center = CGPointMake(180, 200);
    [self.view addSubview:label];
    
    label.flickeringGap = 0.1;
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

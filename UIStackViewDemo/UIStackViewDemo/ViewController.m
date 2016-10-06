//
//  ViewController.m
//  UIStackViewDemo
//
//  Created by myy on 2016/10/4.
//  Copyright © 2016年 zzedu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)addStarAction:(id)sender {
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img2"]];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    [_secondStackView addArrangedSubview:imageView];
    [UIView animateWithDuration:0.25 animations:^{
        //由于Stack View自动为我们管理Auto Layout constraints，我们只能调用layoutIfNeeded来实现动画。
        [_secondStackView layoutIfNeeded];
    }];
}


- (IBAction)removeStarAction:(id)sender {
    UIImageView *imageView = _secondStackView.arrangedSubviews.lastObject;
    if (imageView) {
        
        //需要注意的是：removeStar(_:)里调用removeFromSuperview是把subview从视图层级中移除。再次调用removeArrangedSubview(_:)只是告诉Stack View不再需要管理subview的约束。而subview会一直保持在视图层级结构中直到调用removeFromSuperview把它移除。
        [_secondStackView removeArrangedSubview:imageView];
        [imageView removeFromSuperview];
        [UIView animateWithDuration:0.25 animations:^{
            [_secondStackView layoutIfNeeded];
        }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end

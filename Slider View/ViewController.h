//
//  ViewController.h
//  Slider View
//
//  Created by Humberto Contreras on 3/29/17.
//  Copyright © 2017 Humberto Contreras. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControll;

@end


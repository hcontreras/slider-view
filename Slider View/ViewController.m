//
//  ViewController.m
//  Slider View
//
//  Created by Humberto Contreras on 3/29/17.
//  Copyright © 2017 Humberto Contreras. All rights reserved.
//

#import "ViewController.h"
#import "Slide.h"

@interface ViewController (){
    NSArray *slides;
}

@end

@implementation ViewController

@synthesize scrollView = _scrollView, pageControll = _pageControll;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [_scrollView setDelegate:self];
    slides = [NSArray new];
    slides = [self createSlides];
    [self setupSlideScrollView:slides];
    
    [_pageControll setNumberOfPages:[slides count]];
    [_pageControll setCurrentPage:0];
    [[self view] bringSubviewToFront:_pageControll];
}

- (NSArray *)createSlides{

    Slide *slide1 = [[[NSBundle mainBundle] loadNibNamed:@"Slide" owner:self options:nil] firstObject];
    [[slide1 lblText] setText:@"Slide1"];
    
    Slide *slide2 = [[[NSBundle mainBundle] loadNibNamed:@"Slide" owner:self options:nil] firstObject];
    [[slide2 lblText] setText:@"Slide2"];
    
    return [[NSArray alloc] initWithObjects:slide1, slide2, nil];
}

- (void)setupSlideScrollView:(NSArray *)slides{

    //_scrollView.frame = self.view.bounds;// The shorten way of below line.
    _scrollView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    _scrollView.contentSize = CGSizeMake((self.view.frame.size.width*2), self.view.frame.size.height);
    [_scrollView setPagingEnabled:YES];
    
    for (int i=0; i<[self->slides count]; i++){
        Slide *slide = [self->slides objectAtIndex:i];
        slide.frame = CGRectMake((self.view.frame.size.width*i), 0, self.view.frame.size.width, self.view.frame.size.height);
        [_scrollView addSubview:slide];
    }
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSInteger indexPage = round(_scrollView.contentOffset.x/self.view.frame.size.width);
    [_pageControll setCurrentPage:indexPage];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

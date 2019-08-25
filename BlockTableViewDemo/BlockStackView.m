//
//  BlockStackView.m
//  BlockStackViewDemo
//
//  Created by dongbailan on 2019/8/25.
//  Copyright © 2019 pfl. All rights reserved.
//

#import "BlockStackView.h"
#import "BlockStackView+Events.h"


@interface BlockStackView()
/**stackView*/
@property (nonatomic, strong) UIStackView *stackView;
/**baseView*/
@property (nonatomic, strong) UIView *baseView;

/**shadowView*/
@property (nonatomic, strong) UIView *shadowView;

/**scrollView*/
@property (nonatomic, strong) UIScrollView *scrollView;



@end

@implementation BlockStackView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (void)didMoveToSuperview {
    [super didMoveToSuperview];
    [self setupSubviews];
}

- (void)setupSubviews {
    [self addSubview:self.shadowView];
    [self.scrollView addSubview:self.stackView];
    self.shadowView.backgroundColor = [UIColor whiteColor];
    [self setupShadowStyleForView:self.shadowView];
    
    if (self.dataSource) {
        NSUInteger number = [self.dataSource blockStackView:self numberOfRowsInSection:0];
        CGFloat totalHeight = 0;
        
        for (int j = 0; j<number; j++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:j inSection:0];
            UIView *view = [self.dataSource blockStackView:self viewForRowAtIndexPath:indexPath];
            view.tag = number;
            [self handleEventWithItem:view target:self action:@selector(didTapedAction:)];
            if ([self.delegate respondsToSelector:@selector(blockStackView:heightAtIndexPath:)]) {
                totalHeight += [self.delegate blockStackView:self heightAtIndexPath:indexPath];
            }
            [self.stackView addArrangedSubview:view];
        }
        CGRect rect = self.stackView.frame;
        rect.size.height = totalHeight;
        self.stackView.frame = rect;
        
//        rect = self.shadowView.frame;
//        rect.size.height = totalHeight;
//        self.shadowView.frame = rect;
        
        self.scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.scrollView.bounds), totalHeight);
    }
}

#pragma mark getter & setter

- (UIView *)baseView {
    if (_baseView == nil) {
        _baseView = [[UIView alloc] initWithFrame:self.bounds];
        [self addSubview:_baseView];
    }
    return _baseView;
}

- (UIStackView *)stackView {
    if (_stackView == nil) {
        _stackView = [[UIStackView alloc] initWithFrame:self.bounds];
        _stackView.axis = UILayoutConstraintAxisVertical;
        _stackView.distribution = UIStackViewDistributionFillEqually;
        _stackView.alignment = UIStackViewAlignmentFill;
        _stackView.spacing = self.spacing;
    }
    return _stackView;
}

- (UIView *)shadowView {
    if (_shadowView == nil) {
        _shadowView = [[UIView alloc] initWithFrame:self.bounds];
    }
    return _shadowView;
}

- (UIScrollView *)scrollView {
    if (_scrollView == nil) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _scrollView.layer.cornerRadius = 10;
        [self.baseView addSubview:_scrollView];
    }
    return _scrollView;
}

#pragma mark private methods

- (void)setupShadowStyleForView:(UIView*)view {
    view.layer.cornerRadius = 10;
    view.layer.shadowColor = UIColor.blackColor.CGColor;
    view.layer.shadowOffset = CGSizeMake(0, 0);
    view.layer.shadowOpacity = 0.3;
    view.layer.shadowRadius = 3;
}

#pragma mark

- (NSInteger)numberOfSections {
    return 1;
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section {
    return self.stackView.arrangedSubviews.count;
}




@end












//
//  BlockTableView.m
//  BlockTableViewDemo
//
//  Created by dongbailan on 2019/8/25.
//  Copyright © 2019 pfl. All rights reserved.
//

#import "BlockTableView.h"

@interface BlockTableView()

/**baseView*/
@property (nonatomic, strong) UIView *baseView;

/**shadowView*/
@property (nonatomic, strong) UIView *shadowView;

/**tableView*/
@property (nonatomic, strong) UITableView *tableView;

/**UITableViewStyle*/
@property (nonatomic, assign) UITableViewStyle tableViewStyle;



@end


@implementation BlockTableView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [self initWithFrame:frame style:UITableViewStylePlain];
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame];
    if (self) {
        _tableViewStyle = style;
    }
    return self;
}

- (void)didMoveToSuperview {
    [super didMoveToSuperview];
    [self setupSubviews];
}

- (void)setupSubviews {
    [self addSubview:self.shadowView];
    [self.baseView addSubview:self.tableView];
    self.shadowView.backgroundColor = [UIColor whiteColor];
    [self setupShadowStyleForView:self.shadowView];
}

#pragma mark getter & setter

- (UIView *)baseView {
    if (_baseView == nil) {
        _baseView = [[UIView alloc] initWithFrame:self.bounds];
        _baseView.layer.cornerRadius = 10;
        _baseView.layer.masksToBounds = YES;
        [self addSubview:_baseView];
    }
    return _baseView;
}


- (UIView *)shadowView {
    if (_shadowView == nil) {
        _shadowView = [[UIView alloc] initWithFrame:self.bounds];
    }
    return _shadowView;
}

- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.baseView.bounds style:self.tableViewStyle];
        [self setupTableView];
        [self.baseView addSubview:_tableView];
    }
    return _tableView;
}

#pragma mark private methods

- (void)setupTableView {
    _tableView.delegate = self.delegate;
    _tableView.dataSource = self.dataSource;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    _tableView.separatorInset = self.separatorInset;// UIEdgeInsetsMake(0, 23, 0, 23);
    _tableView.rowHeight = self.rowHeight;
    _tableView.sectionHeaderHeight = self.sectionHeaderHeight;
    _tableView.sectionFooterHeight = self.sectionFooterHeight;
    _tableView.estimatedRowHeight = self.estimatedRowHeight;
    _tableView.estimatedSectionHeaderHeight = self.estimatedSectionHeaderHeight;
    _tableView.estimatedSectionFooterHeight = self.estimatedSectionFooterHeight;
    _tableView.backgroundView = self.backgroundView;
}

- (void)setupShadowStyleForView:(UIView*)view {
    view.layer.cornerRadius = 10;
    view.layer.shadowColor = UIColor.blackColor.CGColor;
    view.layer.shadowOffset = CGSizeMake(0, 0);
    view.layer.shadowOpacity = 0.3;
    view.layer.shadowRadius = 3;
}

#pragma mark

- (NSInteger)numberOfRowsInSection:(NSInteger)section {
    return [self.tableView numberOfRowsInSection:section];
}

- (NSInteger)numberOfSections {
    return self.tableView.numberOfSections;
}

- (void)reloadData {
    [self.tableView reloadData];
}




@end

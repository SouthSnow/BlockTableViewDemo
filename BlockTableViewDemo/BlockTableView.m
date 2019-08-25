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
    [self addSubview:self.baseView];
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
    }
    return _tableView;
}

- (void)setSeparatorInset:(UIEdgeInsets)separatorInset {
    self.tableView.separatorInset = separatorInset;
    _separatorInset = separatorInset;
}

- (void)setDataSource:(id<BlockTableViewDataSource>)dataSource {
    _dataSource = dataSource;
    self.tableView.dataSource = dataSource;
}

- (void)setDelegate:(id<BlockTableViewDelegate>)delegate {
    _delegate = delegate;
    self.tableView.delegate = delegate;
}

#pragma mark private methods

- (void)setupTableView {
    _tableView.delegate = self.delegate;
    _tableView.dataSource = self.dataSource;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    _tableView.separatorInset =  UIEdgeInsetsMake(0, 23, 0, 23);
    _tableView.rowHeight = self.rowHeight;
    _tableView.sectionHeaderHeight = self.sectionHeaderHeight;
    _tableView.sectionFooterHeight = self.sectionFooterHeight;
    _tableView.estimatedRowHeight = self.estimatedRowHeight;
    _tableView.estimatedSectionHeaderHeight = self.estimatedSectionHeaderHeight;
    _tableView.estimatedSectionFooterHeight = self.estimatedSectionFooterHeight;
    _tableView.backgroundView = self.backgroundView;
    _tableView.scrollEnabled = NO;
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

- (void)registerNib:(nullable UINib *)nib forCellReuseIdentifier:(NSString *)identifier  {
    [self.tableView  registerNib: nib forCellReuseIdentifier:identifier];
}
- (void)registerClass:(nullable Class)cellClass forCellReuseIdentifier:(NSString *)identifier  {
    [self.tableView  registerClass: cellClass forCellReuseIdentifier:identifier];
}

- (void)registerNib:(nullable UINib *)nib forHeaderFooterViewReuseIdentifier:(NSString *)identifier {
    [self.tableView registerNib:nib forHeaderFooterViewReuseIdentifier:identifier];
}
- (void)registerClass:(nullable Class)aClass forHeaderFooterViewReuseIdentifier:(NSString *)identifier {
    [self.tableView registerClass: aClass forHeaderFooterViewReuseIdentifier:identifier];
}




@end

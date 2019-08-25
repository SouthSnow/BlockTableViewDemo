//
//  BlockTableView.h
//  BlockTableViewDemo
//
//  Created by dongbailan on 2019/8/25.
//  Copyright © 2019 pfl. All rights reserved.
//

#import <UIKit/UIKit.h>


@class BlockTableView;

@protocol BlockTableViewDataSource <NSObject, UITableViewDataSource>
@end

@protocol BlockTableViewDelegate <NSObject, UITableViewDelegate>
@end

NS_ASSUME_NONNULL_BEGIN

@interface BlockTableView : UIView
/**tableView*/
@property (nonatomic, strong, readonly) UITableView *tableView;
@property (nonatomic, weak) id <BlockTableViewDataSource> dataSource;
@property (nonatomic, weak) id <BlockTableViewDelegate> delegate;

@property (nonatomic) CGFloat rowHeight;
@property (nonatomic) CGFloat sectionHeaderHeight;
@property (nonatomic) CGFloat sectionFooterHeight;
@property (nonatomic) CGFloat estimatedRowHeight;
@property (nonatomic) CGFloat estimatedSectionHeaderHeight;
@property (nonatomic) CGFloat estimatedSectionFooterHeight;

@property (nonatomic) UIEdgeInsets separatorInset;
@property (nonatomic) UITableViewCellSeparatorStyle separatorStyle;
@property (nonatomic, strong, nullable) UIView *backgroundView;

@property (nonatomic, readonly) NSInteger numberOfSections;
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style;

- (NSInteger)numberOfRowsInSection:(NSInteger)section;
- (void)reloadData;

- (void)registerNib:(nullable UINib *)nib forCellReuseIdentifier:(NSString *)identifier;
- (void)registerClass:(nullable Class)cellClass forCellReuseIdentifier:(NSString *)identifier;
- (void)registerNib:(nullable UINib *)nib forHeaderFooterViewReuseIdentifier:(NSString *)identifier;
- (void)registerClass:(nullable Class)aClass forHeaderFooterViewReuseIdentifier:(NSString *)identifier;

@end

NS_ASSUME_NONNULL_END

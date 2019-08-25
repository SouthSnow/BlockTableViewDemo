//
//  BlockStackView.h
//  BlockStackViewDemo
//
//  Created by dongbailan on 2019/8/25.
//  Copyright © 2019 pfl. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class BlockStackView;

@protocol BlockStackViewDataSource <NSObject>

@required
- (NSInteger)blockStackView:(BlockStackView *)blockStackView numberOfRowsInSection:(NSInteger)section;
- (UIView *)blockStackView:(BlockStackView *)blockStackView viewForRowAtIndexPath:(NSIndexPath *)indexPath;

@end

@protocol BlockStackViewDelegate <NSObject>

@optional
- (CGFloat)blockStackView:(BlockStackView *)blockStackView heightAtIndexPath:(NSIndexPath*)indexPath;
- (void)blockStackView:(BlockStackView *)blockStackView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;


@end

@interface BlockStackView : UIView
@property (nonatomic, weak) id <BlockStackViewDataSource> dataSource;
@property (nonatomic, weak) id <BlockStackViewDelegate> delegate;

/**spacing*/
@property (nonatomic, assign) CGFloat spacing;

@property (nonatomic, readonly) NSInteger numberOfSections;

- (NSInteger)numberOfRowsInSection:(NSInteger)section;



@end

NS_ASSUME_NONNULL_END

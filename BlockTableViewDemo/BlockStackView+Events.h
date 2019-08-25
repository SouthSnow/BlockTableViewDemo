//
//  BlockStackView+Events.h
//  BlockStackViewDemo
//
//  Created by dongbailan on 2019/8/25.
//  Copyright © 2019 pfl. All rights reserved.
//

#import "BlockStackView.h"

NS_ASSUME_NONNULL_BEGIN

@interface BlockStackView (Events)
- (void)handleEventWithItem:(UIView*)item target:(id)target action:(SEL)action;

- (void)didTapedAction:(UIView*)sender;

@end

NS_ASSUME_NONNULL_END

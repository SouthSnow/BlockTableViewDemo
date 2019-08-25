//
//  BlockStackView+Events.m
//  BlockStackViewDemo
//
//  Created by dongbailan on 2019/8/25.
//  Copyright © 2019 pfl. All rights reserved.
//

#import "BlockStackView+Events.h"

@implementation BlockStackView (Events)

- (void)handleEventWithItem:(UIView*)item target:(id)target action:(SEL)action {
    if ([item isKindOfClass:UIControl.class]) {
        [(UIControl*)item addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    else {
        item.userInteractionEnabled = YES;
        [item addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:target action:action]];
    }
}

- (void)didTapedAction:(UIView*)sender {
//    NSInvocation
    
    if ([sender isKindOfClass:UIView.class]) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:sender.tag inSection:0];
        if ([self.delegate respondsToSelector:@selector(blockStackView:didSelectRowAtIndexPath:)]) {
            [self.delegate blockStackView:self didSelectRowAtIndexPath:indexPath];
        }
    }
    else if ([sender isKindOfClass:UIGestureRecognizer.class]) {
        UIView *v = [(UIGestureRecognizer*)sender view];
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:v.tag inSection:0];
        if ([self.delegate respondsToSelector:@selector(blockStackView:didSelectRowAtIndexPath:)]) {
            [self.delegate blockStackView:self didSelectRowAtIndexPath:indexPath];
        }
    }
    

    
}

@end

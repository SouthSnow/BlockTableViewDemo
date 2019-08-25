//
//  ViewController.m
//  BlockStackViewDemo
//
//  Created by dongbailan on 2019/8/25.
//  Copyright © 2019 pfl. All rights reserved.
//

#import "ViewController.h"
#import "BlockStackView.h"
#import "BlockTableView.h"


#define H 60
#define leading 23
#define itemLeading 20
#define N 5
#define aspacing 0

@interface ViewController ()<BlockStackViewDataSource, BlockStackViewDelegate, BlockTableViewDelegate, BlockTableViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.groupTableViewBackgroundColor;
    
    BlockStackView *blockView = [[BlockStackView alloc] initWithFrame:CGRectMake(leading, 100, self.view.bounds.size.width-leading*2, (H+aspacing)*N)];
//    blockView.backgroundColor = UIColor.redColor;
    blockView.dataSource = self;
    blockView.delegate = self;
    blockView.spacing = aspacing;
    [self.view addSubview:blockView];
    
    BlockTableView *tableView = [[BlockTableView alloc] initWithFrame:CGRectMake(leading, CGRectGetMaxY(blockView.frame)+50, self.view.bounds.size.width-leading*2, (H+aspacing)*N) style:UITableViewStylePlain];
    //    blockView.backgroundColor = UIColor.redColor;
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.separatorInset = UIEdgeInsetsMake(0, 23, 0, 23);
    [self.view addSubview:tableView];
    
}


#pragma mark delegate

- (CGFloat)blockStackView:(BlockStackView *)blockStackView heightAtIndexPath:(NSIndexPath *)indexPath {
    return (H+aspacing);
}

- (void)blockStackView:(BlockStackView *)blockStackView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%@---%@",NSStringFromSelector(_cmd), indexPath);
}


#pragma mark datasource

- (NSInteger)blockStackView:(BlockStackView *)blockStackView numberOfRowsInSection:(NSInteger)section {
    return N;
}

- (UIView *)blockStackView:(BlockStackView *)blockStackView viewForRowAtIndexPath:(NSIndexPath *)indexPath {
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width-leading*2, H)];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(itemLeading,0 , 100, H)];
    label.text = @"title1";
    UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(label.frame), 0, 100, H)];
    contentLabel.text = @"(username, plainPassword, encryptedPassword, name, email, creationDate, modificationDate) VALUES c(‘admin’,’admin’,’admin’,’Administrator’,’pflnh@163.com','0','0');";
    [v addSubview:label];
    [v addSubview:contentLabel];
    
    if (indexPath.row <N - 1) {
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(v.bounds)-1, CGRectGetWidth(v.bounds), 1)];
        line.backgroundColor = UIColor.lightGrayColor;
        line.alpha = 0.5;
        [v addSubview:line];
    }
 
    if (indexPath.row % 2) {
//        v.backgroundColor = [UIColor greenColor];
    }
    return v;
}


#pragma mark BlockTableViewDelegate, BlockTableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return N;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = @"Demo";
    cell.detailTextLabel.text = @"detailTextLabel";
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return H;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%@---%@",NSStringFromSelector(_cmd), indexPath);
}


@end

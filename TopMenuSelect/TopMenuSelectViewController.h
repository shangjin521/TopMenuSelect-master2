//
//  TopMenuSelectViewController.h
//  TopMenuSelect
//
//  Created by ecar on 16/3/15.
//  Copyright © 2016年 zhangqian. All rights reserved.
//

#import "BaseViewController.h"

@interface TopMenuSelectViewController : BaseViewController

@property (weak, nonatomic) IBOutlet UIScrollView *menuScrollView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) UIView *menuBgView;
@property (strong, nonatomic) NSArray *menuArray;
@property (strong, nonatomic) NSArray *ImageArray;
@property (strong, nonatomic) NSArray *ImageArray2;
@property (strong, nonatomic) NSMutableArray *tableViewArray;
@property (strong, nonatomic) NSMutableArray *LabelArray;
@property (strong, nonatomic) NSMutableArray *ImageViewArray;
@property (strong, nonatomic) UITableView *refreshTableView;
@property (copy, nonatomic) NSString *menuTittle;

@end

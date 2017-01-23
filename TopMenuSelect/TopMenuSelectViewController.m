//
//  TopMenuSelectViewController.m
//  TopMenuSelect
//
//  Created by ecar on 16/3/15.
//  Copyright © 2016年 zhangqian. All rights reserved.
//

#import "TopMenuSelectViewController.h"

#define MENU_BUTTON_WIDTH  [[UIScreen mainScreen] bounds].size.width/4
#define ViewWidth [[UIScreen mainScreen] bounds].size.width
#define ViewHeight [[UIScreen mainScreen] bounds].size.height

@interface TopMenuSelectViewController () <UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
{
    UILabel *label;
    UILabel *label1;
    UILabel *label2;
    UILabel *label3;
    UILabel *label4;
    UIImageView *imageV;
    UIImageView *imageV1;
    UIImageView *imageV2;
    UIImageView *imageV3;
    UIImageView *imageV4;
}
@end

@implementation TopMenuSelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.title = @"菜单";
    _tableViewArray = [[NSMutableArray alloc]init];
    _LabelArray = [[NSMutableArray alloc] init];
    _ImageViewArray = [[NSMutableArray alloc] init];
    [self createMenu];
    [self refreshTableView:0];
}

- (void)createMenu {
    _menuArray = @[@"简介",@"首末车",@"站口",@"公交"];
    _ImageArray = @[@"ic_desc_normal",@"ic_time_normal",@"ic_site_normal",@"ic_bus_normal"];
    _ImageArray2 = @[@"ic_desc_select",@"ic_time_select",@"ic_site_select",@"ic_bus_select"];
    for (int i = 0; i < _menuArray.count; i ++) {
        UIButton *menu = [UIButton buttonWithType:UIButtonTypeCustom];
        [menu setFrame:CGRectMake(MENU_BUTTON_WIDTH * i, 0, MENU_BUTTON_WIDTH, _menuScrollView.frame.size.height)];
        imageV = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 20, 20)];
        [menu addSubview:imageV];
        label = [[UILabel alloc] initWithFrame:CGRectMake(40, 10, menu.frame.size.width-40-10, 20)];
        label.text = _menuArray[i];
        if (i == 0) {
            label.textColor = [UIColor redColor];
            imageV.image = [UIImage imageNamed:_ImageArray2[i]];
        }
        else
        {
            label.textColor = [UIColor blueColor];
            imageV.image = [UIImage imageNamed:_ImageArray[i]];
        }
        label.font = [UIFont systemFontOfSize:14.0];
        [menu addSubview:label];
        [_LabelArray addObject:label];
        [_ImageViewArray addObject:imageV];
        menu.tag = i;
        [menu addTarget:self action:@selector(selectMenu:) forControlEvents:UIControlEventTouchUpInside];
        [_menuScrollView addSubview:menu];
    }
    [_menuScrollView setContentSize:CGSizeMake(MENU_BUTTON_WIDTH * _menuArray.count, _menuScrollView.frame.size.height)];
    _menuBgView = [[UIView alloc]initWithFrame:CGRectMake(0, _menuScrollView.frame.size.height - 2, MENU_BUTTON_WIDTH, 2)];
    [_menuBgView setBackgroundColor:[UIColor redColor]];
    [_menuScrollView addSubview:_menuBgView];
    _scrollView.contentSize = CGSizeMake(ViewWidth * _menuArray.count, _scrollView.frame.size.height);
    [self addTableViewToScrollView:_scrollView count:_menuArray.count frame:CGRectZero];
}

- (void)selectMenu:(UIButton *)sender {
    [_scrollView setContentOffset:CGPointMake(ViewWidth * sender.tag, 0) animated:YES];
    float xx = ViewWidth * (sender.tag - 1) * (MENU_BUTTON_WIDTH / ViewWidth) - MENU_BUTTON_WIDTH;
    [_menuScrollView scrollRectToVisible:CGRectMake(xx, 0, ViewWidth, _menuScrollView.frame.size.height) animated:YES];
    if (sender.tag == 0) {
        label1 = _LabelArray[sender.tag];
        imageV1 = _ImageViewArray[sender.tag];
        label1.textColor = [UIColor redColor];
        imageV1.image = [UIImage imageNamed:_ImageArray2[sender.tag]];
        
        label2 = _LabelArray[1];
        label2.textColor = [UIColor blueColor];
        imageV2.image = [UIImage imageNamed:_ImageArray[1]];
        label3 = _LabelArray[2];
        label3.textColor = [UIColor blueColor];
        imageV3.image = [UIImage imageNamed:_ImageArray[2]];
        label4 = _LabelArray[3];
        label4.textColor = [UIColor blueColor];
        imageV4.image = [UIImage imageNamed:_ImageArray[3]];
    }
    if (sender.tag == 1) {
        label2 = _LabelArray[sender.tag];
        imageV2 = _ImageViewArray[sender.tag];
        label2.textColor = [UIColor redColor];
        imageV2.image = [UIImage imageNamed:_ImageArray2[sender.tag]];
        
        label1 = _LabelArray[0];
        label1.textColor = [UIColor blueColor];
        imageV1.image = [UIImage imageNamed:_ImageArray[0]];
        label3 = _LabelArray[2];
        label3.textColor = [UIColor blueColor];
        imageV3.image = [UIImage imageNamed:_ImageArray[2]];
        label4 = _LabelArray[3];
        label4.textColor = [UIColor blueColor];
        imageV4.image = [UIImage imageNamed:_ImageArray[3]];
    }
    if (sender.tag == 2) {
        label3 = _LabelArray[sender.tag];
        imageV3 = _ImageViewArray[sender.tag];
        label3.textColor = [UIColor redColor];
        imageV3.image = [UIImage imageNamed:_ImageArray2[sender.tag]];
        
        label1 = _LabelArray[0];
        label1.textColor = [UIColor blueColor];
        imageV1.image = [UIImage imageNamed:_ImageArray[0]];
        label2 = _LabelArray[1];
        label2.textColor = [UIColor blueColor];
        imageV2.image = [UIImage imageNamed:_ImageArray[1]];
        label4 = _LabelArray[3];
        label4.textColor = [UIColor blueColor];
        imageV4.image = [UIImage imageNamed:_ImageArray[3]];
    }
    if (sender.tag == 3) {
        label4 = _LabelArray[sender.tag];
        imageV4 = _ImageViewArray[sender.tag];
        label4.textColor = [UIColor redColor];
        imageV4.image = [UIImage imageNamed:_ImageArray2[sender.tag]];
        
        label1 = _LabelArray[0];
        label1.textColor = [UIColor blueColor];
        imageV1.image = [UIImage imageNamed:_ImageArray[0]];
        label2 = _LabelArray[1];
        label2.textColor = [UIColor blueColor];
        imageV2.image = [UIImage imageNamed:_ImageArray[1]];
        label3 = _LabelArray[2];
        label3.textColor = [UIColor blueColor];
        imageV3.image = [UIImage imageNamed:_ImageArray[2]];
    }
    [self refreshTableView:(int)sender.tag];
}

- (void)addTableViewToScrollView:(UIScrollView *)scrollView count:(NSUInteger)pageCount frame:(CGRect)frame {
    for (int i = 0; i < pageCount; i++) {
        UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(ViewWidth * i, 0 , ViewWidth, ViewHeight - _menuScrollView.frame.size.height - 64)];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.tag = i;
        [_tableViewArray addObject:tableView];
        [scrollView addSubview:tableView];
    }
}

- (void)refreshTableView:(int)index {
    
    _refreshTableView = _tableViewArray[index];
    NSLog(@"%ld",_refreshTableView.tag);
    _menuTittle = _menuArray[index];
    self.title = _menuArray[_refreshTableView.tag];
    if (_refreshTableView.tag == 0) {
        label1 = _LabelArray[_refreshTableView.tag];
        imageV1 = _ImageViewArray[_refreshTableView.tag];
        label1.textColor = [UIColor redColor];
        imageV1.image = [UIImage imageNamed:_ImageArray2[_refreshTableView.tag]];
        
        label2 = _LabelArray[1];
        label2.textColor = [UIColor blueColor];
        imageV2.image = [UIImage imageNamed:_ImageArray[1]];
        label3 = _LabelArray[2];
        label3.textColor = [UIColor blueColor];
        imageV3.image = [UIImage imageNamed:_ImageArray[2]];
        label4 = _LabelArray[3];
        label4.textColor = [UIColor blueColor];
        imageV4.image = [UIImage imageNamed:_ImageArray[3]];
    }
    if (_refreshTableView.tag == 1) {
        label2 = _LabelArray[_refreshTableView.tag];
        imageV2 = _ImageViewArray[_refreshTableView.tag];
        label2.textColor = [UIColor redColor];
        imageV2.image = [UIImage imageNamed:_ImageArray2[_refreshTableView.tag]];
        
        label1 = _LabelArray[0];
        label1.textColor = [UIColor blueColor];
        imageV1.image = [UIImage imageNamed:_ImageArray[0]];
        label3 = _LabelArray[2];
        label3.textColor = [UIColor blueColor];
        imageV3.image = [UIImage imageNamed:_ImageArray[2]];
        label4 = _LabelArray[3];
        label4.textColor = [UIColor blueColor];
        imageV4.image = [UIImage imageNamed:_ImageArray[3]];
    }
    if (_refreshTableView.tag == 2) {
        label3 = _LabelArray[_refreshTableView.tag];
        imageV3 = _ImageViewArray[_refreshTableView.tag];
        label3.textColor = [UIColor redColor];
        imageV3.image = [UIImage imageNamed:_ImageArray2[_refreshTableView.tag]];
        
        label1 = _LabelArray[0];
        label1.textColor = [UIColor blueColor];
        imageV1.image = [UIImage imageNamed:_ImageArray[0]];
        label2 = _LabelArray[1];
        label2.textColor = [UIColor blueColor];
        imageV2.image = [UIImage imageNamed:_ImageArray[1]];
        label4 = _LabelArray[3];
        label4.textColor = [UIColor blueColor];
        imageV4.image = [UIImage imageNamed:_ImageArray[3]];
    }
    if (_refreshTableView.tag == 3) {
        label4 = _LabelArray[_refreshTableView.tag];
        imageV4 = _ImageViewArray[_refreshTableView.tag];
        label4.textColor = [UIColor redColor];
        imageV4.image = [UIImage imageNamed:_ImageArray2[_refreshTableView.tag]];
        
        label1 = _LabelArray[0];
        label1.textColor = [UIColor blueColor];
        imageV1.image = [UIImage imageNamed:_ImageArray[0]];
        label2 = _LabelArray[1];
        label2.textColor = [UIColor blueColor];
        imageV2.image = [UIImage imageNamed:_ImageArray[1]];
        label3 = _LabelArray[2];
        label3.textColor = [UIColor blueColor];
        imageV3.image = [UIImage imageNamed:_ImageArray[2]];
    }
    CGRect frame = _refreshTableView.frame;
    frame.origin.x = ViewWidth * index;
    [_refreshTableView setFrame:frame];
    _refreshTableView.tableFooterView = [[UIView alloc] init];
    [_refreshTableView reloadData];
}

- (void)changeView:(float)x {
    float xx = x * (MENU_BUTTON_WIDTH / ViewWidth);
    [_menuBgView setFrame:CGRectMake(xx, _menuBgView.frame.origin.y, _menuBgView.frame.size.width, _menuBgView.frame.size.height)];
}

#pragma mark - UITableViewDataSource和UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (_refreshTableView.tag == 0) {
        UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.textLabel.text = [NSString stringWithFormat:@"%@ %ld",_menuTittle,(long)indexPath.row];
        return cell;
    }
    else
    {
        UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.textLabel.text = [NSString stringWithFormat:@"%@ %ld",_menuTittle,(long)indexPath.row];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //只要滚动了就会触发
    if ([scrollView isKindOfClass:[UITableView class]]) {
    }
    else
    {
        [self changeView:scrollView.contentOffset.x];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    //减速停止了时执行，手触摸时执行执行
    if ([scrollView isKindOfClass:[UITableView class]]) {
    }
    else
    {
        float xx = scrollView.contentOffset.x * (MENU_BUTTON_WIDTH / ViewWidth) - MENU_BUTTON_WIDTH;
        [_menuScrollView scrollRectToVisible:CGRectMake(xx, 0, ViewWidth, _menuScrollView.frame.size.height) animated:YES];
        int i = (scrollView.contentOffset.x / ViewWidth);
        [self refreshTableView:i];
    }
}


@end

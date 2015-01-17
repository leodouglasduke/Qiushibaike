//
//  QiushiListViewController.m
//  Qiushibaike
//
//  Created by DukeMou on 15/1/15.
//  Copyright (c) 2015年 河南蓝鸥科技有限公司. All rights reserved.
//

#import "QiushiListViewController.h"
#import "ModelManager.h"
#import "QiushiItemCell.h"
#import "LoadingMoreCell.h"

@interface QiushiListViewController ()

- (void)_refreshData;//下拉刷新响应方法
- (void)_loadingMore;//上提加载响应方法


@end

@implementation QiushiListViewController

- (void)_refreshData {
    [[ModelManager manager] packageModelWithType:ModelPackageTypeRefresh];
}

- (void)_loadingMore {
    [[ModelManager manager] packageModelWithType:ModelPackageTypeLoadingMore];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建UIRefreshControl对象
    self.refreshControl = [[[UIRefreshControl alloc] init] autorelease];
    //修改tintColor
    self.refreshControl.tintColor = [UIColor orangeColor];
    [self.refreshControl addTarget:self action:@selector(_refreshData) forControlEvents:UIControlEventValueChanged];
    //开始刷新
    [self.refreshControl beginRefreshing];
    
    [[ModelManager manager] packageModelWithType:ModelPackageTypeRefresh];
    //让当前视图控制器成为通知的观察者
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshUserInterface) name:kModelsDidFinishPackingNotification object:nil];
    //为表视图注册单元格类型以及重用标示
    [self.tableView registerClass:[QiushiItemCell class] forCellReuseIdentifier:@"cell"];
    [self.tableView registerClass:[LoadingMoreCell class] forCellReuseIdentifier:@"loading"];
    
    UIImage *logoImage = [UIImage imageNamed:@"logo.png"];
    CGRect frame = CGRectZero;
    frame.size = logoImage.size;
    UIImageView *logoView = [[UIImageView alloc] initWithImage:logoImage];
    logoView.frame = frame;
    self.navigationItem.titleView = logoView;
    [logoView release];
}


- (void)refreshUserInterface {
    //结束刷新
    [self.refreshControl endRefreshing];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [[ModelManager manager] numberOfItems] + 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger count = [[ModelManager manager] numberOfItems];
    if (indexPath.row == count) {
        LoadingMoreCell *cell = [tableView dequeueReusableCellWithIdentifier:@"loading" forIndexPath:indexPath];
        return cell;
    } else {
        QiushiItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        
        QiushiItem *item = [[ModelManager manager] itemForRowAtIndexPath:indexPath];
        [cell configureCellWithModel:item];
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger count = [[ModelManager manager] numberOfItems];
    if (count == indexPath.row) {
        return 40;
    } else {
        QiushiItem *item = [[ModelManager manager] itemForRowAtIndexPath:indexPath];
        return [QiushiItemCell cellHeightWithModel:item];
    }
}


- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([cell.reuseIdentifier isEqualToString:@"loading"]) {
        NSInteger count = [[ModelManager manager] numberOfItems];
        if (count != 0) {
            [(LoadingMoreCell *)cell startAnimating];
            [self _loadingMore];
        }
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

//
//  QiushiFindViewController.m
//  Qiushibaike
//
//  Created by DukeMou on 15/1/16.
//  Copyright (c) 2015年 河南蓝鸥科技有限公司. All rights reserved.
//

#import "QiushiFindViewController.h"
#import "FindModel.h"
#import "TOWebViewController.h"

@interface QiushiFindViewController ()

@property (nonatomic, retain) NSMutableArray *datasource;

@end

@implementation QiushiFindViewController

- (void)dealloc {
    [_datasource release];
    [super dealloc];
}

- (NSMutableArray *)datasource {
    if (!_datasource) {
        self.datasource = [NSMutableArray array];
    }
    return _datasource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.tintColor = [UIColor orangeColor];
    
    FindModel *model1 = [[FindModel alloc] init];
    model1.image = [UIImage imageNamed:@"discovery_nearby.png"];
    model1.title = @"附近";
    model1.subtitle = @"查看附近糗友";
    [self.datasource addObject:model1];
    [model1 release];
    
    FindModel *model2 = [[FindModel alloc] init];
    model2.image = [UIImage imageNamed:@"discovery_qiubaihuo.png"];
    model2.title = @"糗百货";
    model2.subtitle = @"萌萌的糗事百科周边，买买买";
    [self.datasource addObject:model2];
    [model2 release];
    
    FindModel *model3 = [[FindModel alloc] init];
    model3.image = [UIImage imageNamed:@"discovery_cafe.png"];
    model3.title = @"里屋";
    model3.subtitle = @"施工中，敬请期待...";
    [self.datasource addObject:model3];
    [model3 release];
    
    FindModel *model4 = [[FindModel alloc] init];
    model4.image = [UIImage imageNamed:@"discovery_game.png"];
    model4.title = @"游戏";
    model4.subtitle = @"施工中，敬请期待...";
    [self.datasource addObject:model4];
    [model4 release];
    
    //单元格的行高
    self.tableView.rowHeight = 80;
    self.title = @"发现";
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
    return self.datasource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier] autorelease];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.detailTextLabel.textColor = [UIColor lightGrayColor];
    }
    FindModel *model = self.datasource[indexPath.row];
    cell.imageView.image = model.image;
    cell.textLabel.text = model.title;
    cell.detailTextLabel.text = model.subtitle;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (1 == indexPath.row) {
        TOWebViewController *webViewController = [[TOWebViewController alloc] initWithURLString:@"http://www.wemart.cn/wemart/microshop/indexm?merchantCode=DPD181947&UID=ios_6CB12D0A5C630115A5D5B0B66DE5AB40"];
        webViewController.title = @"糗百货";
        webViewController.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:webViewController animated:YES];
        [webViewController release];
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

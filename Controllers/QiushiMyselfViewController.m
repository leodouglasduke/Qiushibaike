//
//  QiushiMyselfViewController.m
//  Qiushibaike
//
//  Created by DukeMou on 15/1/16.
//  Copyright (c) 2015年 河南蓝鸥科技有限公司. All rights reserved.
//

#import "QiushiMyselfViewController.h"
#import "MyselfModel.h"

@interface QiushiMyselfViewController ()

@property (nonatomic, retain) NSMutableArray *datasource;

@end

@implementation QiushiMyselfViewController

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
    
    self.title = @"我";
    
    MyselfModel *model1 = [[MyselfModel alloc] init];
    model1.title = @"我的糗友";
    model1.image = [UIImage imageNamed:@"icon_myfriends"];
    [self.datasource addObject:@[model1]];
    [model1 release];
    
    MyselfModel *model2 = [[MyselfModel alloc] init];
    model2.title = @"我发表的";
    model2.image = [UIImage imageNamed:@"icon_posted"];
    MyselfModel *model3 = [[MyselfModel alloc] init];
    model3.title = @"我参与的";
    model3.image = [UIImage imageNamed:@"icon_icommentd.png"];
    MyselfModel *model4 = [[MyselfModel alloc] init];
    model4.title = @"我收藏的";
    model4.image = [UIImage imageNamed:@"icon_myfavourate.png"];
    [self.datasource addObject:@[model2, model3, model4]];
    [model2 release];
    [model3 release];
    [model4 release];
    
    MyselfModel *model5 = [[MyselfModel alloc] init];
    model5.title = @"夜间模式";
    model5.image = [UIImage imageNamed:@"icon_nightmode.png"];
    MyselfModel *model6 = [[MyselfModel alloc] init];
    model6.title = @"设置";
    model6.image = [UIImage imageNamed:@"icon_setting.png"];
    [self.datasource addObject:@[model5, model6]];
    [model5 release];
    [model6 release];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return self.datasource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.datasource[section] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.textColor = [UIColor grayColor];
    
    if (indexPath.section == 2 && indexPath.row == 0) {
        cell.accessoryView = [[[UISwitch alloc] init] autorelease];
    } else {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    // Configure the cell...
    NSArray *array = self.datasource[indexPath.section];
    MyselfModel *model = array[indexPath.row];
    cell.imageView.image = model.image;
    cell.textLabel.text = model.title;
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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

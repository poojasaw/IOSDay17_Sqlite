//
//  ViewController.m
//  IOSDay17_Sqlite
//
//  Created by Student P_10 on 08/05/18.
//  Copyright © 2018 Felix. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   // [[DBWrapper getSharedObject]executeQuery:@"delete from taskTable"];
    NSString *selectQuery=@"select taskId,taskName from taskTable";
    [[DBWrapper getSharedObject] getAllTask:selectQuery];
    if ([DBWrapper getSharedObject].nameArray.count>0)
        self.taskNameArray=[DBWrapper getSharedObject].nameArray;
    
    self.listTableView.delegate=self;
    self.listTableView.dataSource=self;
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)viewWillAppear:(BOOL)animated
{
    NSString *selectQuery=@"select taskId,taskName from taskTable";
    [[DBWrapper getSharedObject] getAllTask:selectQuery];
    if ([DBWrapper getSharedObject].nameArray.count>0)
        self.taskNameArray=[DBWrapper getSharedObject].nameArray;
    [self.listTableView reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.taskNameArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.textLabel.text=[self.taskNameArray objectAtIndex:indexPath.row];
    return cell;
    
}

- (IBAction)barButtonAction:(UIBarButtonItem *)sender
{
    NextViewController *nvc=[self.storyboard instantiateViewControllerWithIdentifier:@"NextViewController"];
    [self.navigationController pushViewController:nvc animated:YES];

}
@end

//
//  NextViewController.m
//  IOSDay17_Sqlite
//
//  Created by Student P_10 on 08/05/18.
//  Copyright © 2018 Felix. All rights reserved.
//

#import "NextViewController.h"

@interface NextViewController ()

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)insertButton:(UIButton *)sender
{
    NSString *insertQuery=[NSString stringWithFormat:@"insert into taskTable(taskId,taskName)values('%@','%@')",self.taskIdText.text,self.taskNameText.text];
    bool isInserted=[[DBWrapper getSharedObject]executeQuery:insertQuery];
    if (isInserted)
    {
        NSLog(@"Insert:successfully");
    }
    else
    {
        NSLog(@"Insert:Failed");
    }
}

- (IBAction)updateButton:(UIButton *)sender
{
    NSString *updateQuery=[NSString stringWithFormat:@"update taskTable SET taskName='%@' WHERE taskId='%@'",self.taskNameText.text,self.taskIdText.text];
    bool isUpdated=[[DBWrapper getSharedObject]executeQuery:updateQuery];
    if (isUpdated)
    {
        NSLog(@"Update:successfully");
    }
    else
    {
        NSLog(@"Update:Failed");
    }
    
}

- (IBAction)deleteButton:(UIButton *)sender
{
    NSString *deleteQuery=[NSString stringWithFormat:@"delete from taskTable where taskName='%@'",self.taskNameText.text];
    bool isDeleted=[[DBWrapper getSharedObject]executeQuery:deleteQuery];
    if (isDeleted)
    {
        NSLog(@"Deleted:successfully");
    }
    else
         {
             NSLog(@"Delete:Failed");
         }
}
@end

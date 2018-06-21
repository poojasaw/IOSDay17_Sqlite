//
//  DBWrapper.m
//  IOSDay17_Sqlite
//
//  Created by Student P_10 on 08/05/18.
//  Copyright © 2018 Felix. All rights reserved.
//

#import "DBWrapper.h"

@implementation DBWrapper
+(instancetype)getSharedObject
{
    static DBWrapper *obj;
    if (obj==nil)
    {
        obj=[[DBWrapper alloc]init];
    }
    return obj;
}
-(NSString *)getDatabasePath
{
    NSArray *DocDir=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path=[[DocDir firstObject]stringByAppendingString:@"/mysqlite.sqlite"];
    return path;
}
-(bool)executeQuery:(NSString *)query
{
    bool success=0;
    sqlite3_stmt *stmt;
    const char *Cquery=[query UTF8String];
    const char *dbPath=[[self getDatabasePath]UTF8String];
    NSLog(@"path=%s",dbPath);
    if (sqlite3_open(dbPath, &taskDatabase)==SQLITE_OK)
    {
        if(sqlite3_prepare_v2(taskDatabase, Cquery, -1, &stmt, nil)==SQLITE_OK)
        {
            if(sqlite3_step(stmt)==SQLITE_DONE)
            {
                success=1;
                sqlite3_finalize(stmt);
                sqlite3_close(taskDatabase);
            }
            else
            {
                NSLog(@"Error in query execution %s",sqlite3_errmsg(taskDatabase));
            }
        }
        else
        {
            NSLog(@"Error in prepare statement %s",sqlite3_errmsg(taskDatabase));
        }
    }
    else
    {
        NSLog(@"Error in opening database %s",sqlite3_errmsg(taskDatabase));
    }
    return success;
}
-(void)createTable
{
    NSString *createquery=@"create table if not exists taskTable(taskId text,taskName text)";
    bool isTableCreated=[self executeQuery:createquery];
    if (isTableCreated)
    {
        NSLog(@"Table created successfully");
    }
    else
    {
        NSLog(@"Table creation Failed");
    }
}
-(void)getAllTask:(NSString *)query
{
    sqlite3_stmt *stmt=nil;
    const char *Cquery=[query UTF8String];
    const char *dbPath=[[self getDatabasePath]UTF8String];
    NSLog(@"path=%s",dbPath);
    self.nameArray=[[NSMutableArray alloc]init];
    if (sqlite3_open(dbPath, &taskDatabase)==SQLITE_OK)
    {
        if(sqlite3_prepare_v2(taskDatabase, Cquery, -1, &stmt, nil)==SQLITE_OK)
        {
            while (sqlite3_step(stmt)==SQLITE_ROW)
            {
                const unsigned char *tName=sqlite3_column_text(stmt,1);
                NSString *taskName=[NSString stringWithFormat:@"%s",tName];
                [self.nameArray addObject:taskName];
            }
            NSLog(@"Names Array:%@",self.nameArray);
        }
        else
        {
            NSLog(@"Error in prepare statement %s",sqlite3_errmsg(taskDatabase));
        }
    }
    else
    {
        NSLog(@"Error in opening database %s",sqlite3_errmsg(taskDatabase));
    }
sqlite3_finalize(stmt);
sqlite3_close(taskDatabase);
}

@end

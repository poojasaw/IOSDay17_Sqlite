//
//  DBWrapper.h
//  IOSDay17_Sqlite
//
//  Created by Student P_10 on 08/05/18.
//  Copyright © 2018 Felix. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
@interface DBWrapper : NSObject
{
    sqlite3 *taskDatabase;
}
+(instancetype)getSharedObject;
-(void)createTable;
-(NSString *)getDatabasePath;
-(bool)executeQuery:(NSString *)query;
-(bool)updateQuery:(NSString *)query;
-(void)getAllTask:(NSString *)query;
@property NSMutableArray *nameArray;
@end

//
//  ViewController.h
//  IOSDay17_Sqlite
//
//  Created by Student P_10 on 08/05/18.
//  Copyright © 2018 Felix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NextViewController.h"
#import "DBWrapper.h"
@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

- (IBAction)barButtonAction:(UIBarButtonItem *)sender;
@property (strong, nonatomic) IBOutlet UITableView *listTableView;
@property NSArray *taskNameArray;

@end


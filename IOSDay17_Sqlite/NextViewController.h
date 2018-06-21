//
//  NextViewController.h
//  IOSDay17_Sqlite
//
//  Created by Student P_10 on 08/05/18.
//  Copyright © 2018 Felix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBWrapper.h"
@interface NextViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *taskIdText;
@property (strong, nonatomic) IBOutlet UITextField *taskNameText;
- (IBAction)insertButton:(UIButton *)sender;
- (IBAction)updateButton:(UIButton *)sender;
- (IBAction)deleteButton:(UIButton *)sender;

@end

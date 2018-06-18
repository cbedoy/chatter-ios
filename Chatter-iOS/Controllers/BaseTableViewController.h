//
//  BaseTableViewController.h
//  Chatter-iOS
//
//  Created by Carlos Bedoy on 6/15/18.
//  Copyright © 2018 Carlos Bedoy. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface BaseTableViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataModel;
@end

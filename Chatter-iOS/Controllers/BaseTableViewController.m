//
//  BaseTableViewController.m
//  Chatter-iOS
//
//  Created by Carlos Bedoy on 6/15/18.
//  Copyright © 2018 Carlos Bedoy. All rights reserved.
//

#import "BaseTableViewController.h"
#import "IModel.h"
@interface BaseTableViewController ()

@end

@implementation BaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataModel = [NSMutableArray array];

    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataModel.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    id object = [self.dataModel objectAtIndex:indexPath.row];
    if ([object respondsToSelector:@selector(height)]) {
        return [object height];
    }
    return 0;
}



@end

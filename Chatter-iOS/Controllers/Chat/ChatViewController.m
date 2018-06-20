//
//  ChatViewController.m
//  Chatter-iOS
//
//  Created by Carlos Bedoy on 6/18/18.
//  Copyright © 2018 Carlos Bedoy. All rights reserved.
//

#import "ChatViewController.h"
#import "SDWebImage/UIImageView+WebCache.h"
#import "MessageCell.h"
@interface ChatViewController ()
@property (nonatomic, strong) NSMutableArray *dataModel;
@end

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self registerNib:@"MessageCell"];
    
    self.dataModel = [NSMutableArray array];
    
    [[self tableView] setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [[self tableView] setBackgroundColor:[UIColor whiteColor]];
    
    // SLKTVC's configuration
    [self setBounces:YES];
    [self setShakeToClearEnabled:YES];
    [self setKeyboardPanningEnabled:NO];
    [self setShouldScrollToBottomAfterKeyboardShows:NO];
    [self setInverted:YES];
    
    [[self textInputbar] setMaxCharCount:1024];
    [[self textInputbar] setAutoHideRightButton:YES];
    [[self textInputbar] setCounterStyle:SLKCounterStyleSplit];
    [[self textInputbar] setCounterPosition:SLKCounterPositionTop];
    
    [[[self textInputbar] editorTitle] setTextColor:[UIColor darkGrayColor]];
    [[self textInputbar] setBackgroundColor:[UIColor whiteColor]];
    [[self textView] setPlaceholder:NSLocalizedString(@"Write a message", nil)];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self setTitle:self.channel.name];
    
    [[self pnControllerHandler] subscribeToChannel:self.channel.identifier withDelegate:self];
    
    [[self pnControllerHandler] requestHistoryFromChannel:self.channel.identifier withCallback:^(NSMutableArray *messages) {
        for (id rawMessage in messages) {
            if ([rawMessage isKindOfClass:[NSDictionary class]]) {
                [self prepareMessage:rawMessage];
            }
        }
    }];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [[self dataModel] removeAllObjects];
    [[self tableView] reloadData];
    
    [[self pnControllerHandler] unSubscribeFromChannel:self.channel.identifier withDelegate:self];
}

- (void)didPressRightButton:(id)sender{
    
    NSString *message = self.textView.text.copy;
    
    NSString *identifier = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    
    [[self pnControllerHandler] sendMessage:message from:identifier toChannel:self.channel.identifier withBlock:^(PNPublishStatus * _Nonnull status) {
                                      [status retry];
    }];
    
    [super didPressRightButton:sender];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataModel.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MessageCell *cell = (MessageCell* )[tableView dequeueReusableCellWithIdentifier:@"MessageCell" forIndexPath:indexPath];
    
    cell.message = self.dataModel[indexPath.row];
    
    [cell reloadInputViews];
    [cell setTransform:self.tableView.transform];
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    id object = [self.dataModel objectAtIndex:indexPath.row];
    if ([object respondsToSelector:@selector(height)]) {
        return [object height];
    }
    return 0;
}

- (void)registerNib:(NSString *)nibString{
    [[self tableView] registerNib:[UINib nibWithNibName:nibString bundle:nil] forCellReuseIdentifier:nibString];
}

- (void)prepareMessage:(NSDictionary *)rawMessage{
    Message *message = [Message new];
    [message setUuid:rawMessage[@"uuid"]];
    [message setFrom:rawMessage[@"from"]];
    [message setAvatar:rawMessage[@"avatar"]];
    [message setNickname:rawMessage[@"nickname"]];
    [message setRawMessage:rawMessage[@"raw_message"]];
    [message setChannel:rawMessage[@"channel"]];
    
    [[self dataModel] insertObject:message atIndex:0];
    
    NSInteger indexOf = [self.dataModel indexOfObject:message];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:indexOf inSection:0];
    NSArray *paths = [NSArray arrayWithObject:indexPath];
    
    [[self tableView] insertRowsAtIndexPaths:paths withRowAnimation:UITableViewRowAnimationFade];
}


#pragma PNControllerDelegate

- (void)onReceivedMessage:(NSDictionary *)message{
    [self prepareMessage:message];
}

- (NSString *)currentChannel{
    return self.channel.identifier;
}


@end

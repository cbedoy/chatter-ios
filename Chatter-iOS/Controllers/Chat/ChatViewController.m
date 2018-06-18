//
//  ChatViewController.m
//  Chatter-iOS
//
//  Created by Carlos Bedoy on 6/18/18.
//  Copyright © 2018 Carlos Bedoy. All rights reserved.
//

#import "ChatViewController.h"
#import "SDWebImage/UIImageView+WebCache.h"
@interface ChatViewController ()

@end

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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
    
    [[self pnControllerHandler] requestHistoryFromChannel:self.channel.identifier withCallback:^(NSMutableArray *messages) {
        
    }];
}

- (void)didPressRightButton:(id)sender{
    [super didPressRightButton:sender];
    
    NSString *message = self.textView.text.copy;
    
    NSString *identifier = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    
    [[self pnControllerHandler] sendMessage:message
                                       from:identifier
                                  toChannel:self.channel.identifier
                                  withBlock:^(PNPublishStatus * _Nonnull status) {
        if (status.data) {
            
        }
    }];
}


@end

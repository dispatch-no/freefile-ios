//
//  SeafShareLinkViewController.m
//  seafileApp
//
//  Created by three on 2019/1/26.
//  Copyright © 2019 Seafile. All rights reserved.
//

#import "SeafShareLinkViewController.h"

@interface SeafShareLinkViewController ()

typedef NS_ENUM(NSUInteger, SECTION_TYPE) {
    SECTION_LINKS,
    SECTION_PASSWORD,
    SECTION_EXPIREDDATE,
};
@property (nonatomic, strong) SeafBase *entry;
    
@property (nonatomic, assign) BOOL showLinks;
@property (nonatomic, assign) BOOL showPassword;
@property (nonatomic, assign) BOOL showExpiredate;

@property (weak, nonatomic) IBOutlet UILabel *linkLabel;
@property (weak, nonatomic) IBOutlet UILabel *downloadlinkLabel;
@property (weak, nonatomic) IBOutlet UISwitch *pwdSwitch;

@end

@implementation SeafShareLinkViewController

- (instancetype)initWithEntry:(SeafBase *)entry {
    self = [super init];
    if (self) {
        self.entry = entry;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.estimatedSectionHeaderHeight = 25;
    self.tableView.estimatedSectionFooterHeight = 25;
    
    [self uodateLinkLabel:self.link];
    self.showPassword = false;
    self.showExpiredate = false;
    [self.pwdSwitch setOn:false];
}

- (void)uodateLinkLabel:(NSString *)link {
    self.showLinks = self.link.length > 0 ? true : false;
    self.linkLabel.text = link;
    self.downloadlinkLabel.text = [NSString stringWithFormat:@"%@?dl", link];
}

#pragma mark - Table view data source
    
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (self.showLinks) {
        return 1;
    } else {
        return 3;
    }
}
    
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.showLinks) {
        if (section == SECTION_LINKS) {
            return 2;
        } else {
            return 0;
        }
    } else {
        if (section == SECTION_LINKS) {
            return 0;
        } else if (section == SECTION_PASSWORD) {
            if (self.showPassword) {
                return 3;
            } else {
                return 1;
            }
        } else if (section == SECTION_EXPIREDDATE) {
            return 2;
        } else {
            return 1;
        }
    }
}
    
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (self.showLinks) {
        return 25;
    } else {
        if (section == SECTION_LINKS) {
            return 0;
        } else {
            return 25;
        }
    }
}
    
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}
    
- (IBAction)closeVC:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
    
- (IBAction)edit:(id)sender {
    self.showLinks = !self.showLinks;
    [self.tableView reloadData];
}
    
- (IBAction)enterPassword:(UISwitch *)sender {
    self.showPassword = sender.on;
    [self.tableView reloadData];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

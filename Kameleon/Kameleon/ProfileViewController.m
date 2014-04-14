//
//  ProfileViewControllerTableViewController.m
//  Kameleon
//
//  Created by Brian Butterfied on 4/7/14.
//  Copyright (c) 2014 Kameleon. All rights reserved.
//

#import "ProfileViewController.h"
#import "Constants.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return PROFILE_NUMBER_SECTIONS;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == PROFILE_SECTION_ACCOUNT_INDEX)
    {
        return PROFILE_SECTION_ACCOUNT_ROWS;
    }
    else if (section == PROFILE_SECTION_PROFILE_INDEX)
    {
        return PROFILE_SECTION_PROFILE_ROWS;
    }
    else
    {
        return 0;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == PROFILE_SECTION_ACCOUNT_INDEX)
    {
        return @"Account Information";
    }
    else if (section == PROFILE_SECTION_PROFILE_INDEX)
    {
        return @"Profile Details";
    }
    else
    {
        return @"";
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *valueCell = [tableView dequeueReusableCellWithIdentifier:PROFILE_CELL_ID_VALUE];
    UITableViewCell *buttonCell = [tableView dequeueReusableCellWithIdentifier:PROFILE_CELL_ID_BUTTON];
    
    
    if (indexPath.section == PROFILE_SECTION_ACCOUNT_INDEX)
    {
        if (indexPath.row == PROFILE_SECTION_ACCOUNT_USERNAME_ROW)
        {
            valueCell.textLabel.text = @"Username";
            valueCell.detailTextLabel.text = @"patrick";
            return valueCell;
        }
        else if (indexPath.row == PROFILE_SECTION_ACCOUNT_EMAIL_ROW)
        {
            valueCell.textLabel.text = @"Email";
            valueCell.detailTextLabel.text = @"patrick@kmln.me";
            return valueCell;
        }
        else if (indexPath.row == PROFILE_SECTION_ACCOUNT_LOGOUT_ROW)
        {
            UIButton *button = (UIButton *)[buttonCell viewWithTag:PROFILE_CELL_BUTTON_TAG];
            [button setTitle:@"Logout" forState:UIControlStateNormal];
            return buttonCell;
        }
    }
    else if (indexPath.section == PROFILE_SECTION_PROFILE_INDEX)
    {
        if (indexPath.row == PROFILE_SECTION_PROFILE_CATEGORY_ROW)
        {
            valueCell.textLabel.text = @"Category";
            valueCell.detailTextLabel.text = @"Woman's";
            return valueCell;
        }
        else if (indexPath.row == PROFILE_SECTION_PROFILE_STYLE_ROW)
        {
            valueCell.textLabel.text = @"Style";
            valueCell.detailTextLabel.text = @"Comtemporary";
            return valueCell;
        }
        else if (indexPath.row == PROFILE_SECTION_PROFILE_COLOR_ROW)
        {
            valueCell.textLabel.text = @"Color";
            valueCell.detailTextLabel.text = @"Neutral";
            return valueCell;
        }
        else if (indexPath.row == PROFILE_SECTION_PROFILE_SIZE_ROW)
        {
            valueCell.textLabel.text = @"Size";
            valueCell.detailTextLabel.text = @"2-3";
            return valueCell;
        }
        else if (indexPath.row == PROFILE_SECTION_PROFILE_PRICE_ROW)
        {
            valueCell.textLabel.text = @"Price";
            valueCell.detailTextLabel.text = @"Conservative";
            return valueCell;
        }
    }
    
    return nil;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

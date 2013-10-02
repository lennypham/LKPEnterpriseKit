//
//  MainTableViewController.m
//  LKPEnterpriseKit
//
//  Created by Leonard Pham on 10/2/13.
//  Copyright (c) 2013 Lenny Pham. All rights reserved.
//

#import "MainTableViewController.h"

typedef enum {
    BarsSection,
    ContentViewsSection,
    ControlsSection,
    TemporaryViewsSection,
    UIEffectsSection
} MyTableSections;

typedef enum {
    StatusBar
} BarsSectionRows;

@interface MainTableViewController ()

@property (nonatomic) NSArray *tableRowTitles;

@property (nonatomic) NSArray *tableSectionTitles;

@end

@implementation MainTableViewController

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self)
    {
        // Custom initialization
        self.tableSectionTitles = @[@"Bars",
                                    @"Content Views",
                                    @"Controls",
                                    @"Temporary Views",
                                    @"UI Effects"];
        
        self.tableRowTitles = @[
                                @[@"Status Bar"],           // Bars
                                @[@"Collection View"],      // Content Views
                                @[@"Activity Indicator"],   // Controls
                                @[@"Alert"],                // Temporary Views
                                @[@"Animations"]            // UIEffects
                                ];
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
    // Return the number of sections.
    return self.tableSectionTitles.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.tableRowTitles[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier
                                                            forIndexPath:indexPath];
    
    // Configure the cell...
    UILabel *rowTitleLabel = (UILabel*)[cell viewWithTag:1001];
    
    rowTitleLabel.text = @"";
    
    rowTitleLabel.text = self.tableRowTitles[indexPath.section][indexPath.row];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return self.tableSectionTitles[section];
}

#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.section)
    {
        case BarsSection:
        {
            switch (indexPath.row) {
                case StatusBar:
                    [self performSegueWithIdentifier:@"PushToStatusBarVC" sender:nil];
                    break;
                    
                default:
                    break;
            }
            break;
        }
        default:
            break;
    }
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end

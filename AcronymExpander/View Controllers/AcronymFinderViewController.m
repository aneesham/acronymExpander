//
//  AcronymFinderViewController.m
//  AcronymExpander
//
//  Created by Aneesha on 10/25/15.
//  Copyright © 2015 Aneesha. All rights reserved.
//

#import "AcronymFinderViewController.h"
#import "Service.h"
#import "LongForm.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import "AcronymTableViewCell.h"

#define kAcronymTableCell @"AcronymTableCell"

@interface AcronymFinderViewController ()

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *resultList;
@property (nonatomic, strong) AcronymTableViewCell *acronymCell;

@property (nonatomic, weak) IBOutlet UISearchBar *searchBar;

@end

@implementation AcronymFinderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Search Acronyms here";
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tableViewTapped:)];
    [self.tableView addGestureRecognizer:tapGesture];
    [tapGesture setCancelsTouchesInView:NO];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (AcronymTableViewCell *)acronymCell
{
    if (!_acronymCell) {
        _acronymCell = [self.tableView dequeueReusableCellWithIdentifier:kAcronymTableCell];
    }
    return _acronymCell;
}


- (void)fetchLongFormsForAcronym:(NSString *)acronym {

    if (acronym.length) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.tableView animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.color = [UIColor lightGrayColor];
        hud.labelText = @"Searching...";
        
        [[Service sharedManager] fetchListOfAbbrevationsForShortForm:acronym withCompletionBlock:^(NSArray *abbrevList, NSError *error) {
            if (!error) {
                self.resultList = abbrevList;
                [self reloadTable];
            }
            else {
                NSLog(@"Error accessing API");
                [self showErrorPrompt];
            }
            hud.removeFromSuperViewOnHide = YES;
            [hud hide:YES];
        }];
    }
}

- (void)reloadTable
{
    [self.tableView reloadData];
}

- (void)tableViewTapped:(id)sender
{
    if ([self.searchBar isFirstResponder]) {
        [self.searchBar resignFirstResponder];
    }
}

- (void)showErrorPrompt {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:@"An error occurred while fetching data, please try after some time" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *  action) {
    }];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:^{
        
    }];

}

#pragma mark - UITableViewDatasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
        return self.resultList.count;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return  UITableViewAutomaticDimension;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    AcronymTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kAcronymTableCell forIndexPath:indexPath];
    
    [self configureCell:cell forRowAtIndexPath:indexPath];
    
    return cell;
}


- (void)configureCell:(AcronymTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    LongForm *lf = self.resultList[indexPath.row];
    [cell configureCellWith:lf];

}



- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 1.0;
}


- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}


- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self tableViewTapped:nil];
}

#pragma mark - UISearchBarDelegate
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
    
    return YES;
}
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{

    [self fetchLongFormsForAcronym:searchBar.text];
}

// called when text starts editing
- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar {
    return YES;
}


- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    
    [searchBar resignFirstResponder];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
}

@end

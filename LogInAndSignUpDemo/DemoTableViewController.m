//
//  DemoTableViewController.m
//  LogInAndSignUpDemo
//
//  Created by Mattieu Gamache-Asselin on 6/14/12.
//  Copyright (c) 2012 Parse. All rights reserved.
//

#import "DemoTableViewController.h"
#import "DefaultSettingsViewController.h"
#import "PropertyConfigViewController.h"
#import "SubclassConfigViewController.h"

@interface DemoTableViewController ()
- (NSString *)titleForCellAtIndexPath:(NSIndexPath *)indexPath;
- (NSString *)subTitleForCellAtIndexPath:(NSIndexPath *)indexPath;
- (UIViewController *)viewControllerForSelectedRowAtIndexPath:(NSIndexPath *)indexPath;
@end

typedef enum {
    DemoTableViewRowDefaultSettings = 0,
    DemoTableViewRowCustomProperties,
    DemoTableViewRowCustomSubclasses,
    DemoTableViewNumberOfRows
} DemoTableViewRow;

@implementation DemoTableViewController

- (void)viewDidLoad {
    self.title = @"Sign Up and Log In Demo";
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return DemoTableViewNumberOfRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    [cell.textLabel setText:[self titleForCellAtIndexPath:indexPath]];
    [cell.detailTextLabel setText:[self subTitleForCellAtIndexPath:indexPath]];
    [cell.detailTextLabel setNumberOfLines:2];
    
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
    [self.navigationController pushViewController:[self viewControllerForSelectedRowAtIndexPath:indexPath] animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 63.0f;
}


#pragma mark - ()

- (NSString *)titleForCellAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellText = nil;
    switch (indexPath.row) {
        case DemoTableViewRowDefaultSettings:
            cellText = @"Using the Defaults";
            break;
        case DemoTableViewRowCustomProperties:
            cellText = @"Property Customization";
            break;
        case DemoTableViewRowCustomSubclasses:
            cellText = @"Subclass Customization";
            break;
        case DemoTableViewNumberOfRows: // never reached.
        default:
            cellText = @"Unknown";
            break;
    }
	return cellText;
}

- (NSString *)subTitleForCellAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellText = nil;
    switch (indexPath.row) {
        case DemoTableViewRowDefaultSettings:
            cellText = @"An example of using the controllers with no customization";
            break;
        case DemoTableViewRowCustomProperties:
            cellText = @"An example of customizing the controllers using the available properties";
            break;
        case DemoTableViewRowCustomSubclasses:
            cellText = @"An example of customizing the controllers using subclasses";
            break;
        case DemoTableViewNumberOfRows: // never reached.
        default:
            cellText = @"Unknown";
            break;
    }
	return cellText;  
}

- (UIViewController *)viewControllerForSelectedRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *nextViewController = nil;
    switch (indexPath.row) {
        case DemoTableViewRowDefaultSettings:
            nextViewController = [[DefaultSettingsViewController alloc] init];
            break;
        case DemoTableViewRowCustomProperties:
            nextViewController = [[PropertyConfigViewController alloc] init];
            break;
        case DemoTableViewRowCustomSubclasses:
            nextViewController = [[SubclassConfigViewController alloc] init];
            break;
        case DemoTableViewNumberOfRows: // never reached.
            break;
    }
	return nextViewController;
}

@end

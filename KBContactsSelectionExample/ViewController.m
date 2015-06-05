//
//  ViewController.m
//  KBContactsSelectionExample
//
//  Created by Kamil Burczyk on 13.12.2014.
//  Copyright (c) 2014 Sigmapoint. All rights reserved.
//

#import "ViewController.h"
#import "KBContactsSelectionViewController.h"

@interface ViewController () <KBContactsSelectionViewControllerDelegate>

@end

@implementation ViewController

- (IBAction)push:(UIButton *)sender {
    
    KBContactsSelectionViewController *vc = [KBContactsSelectionViewController contactsSelectionViewControllerWithConfiguration:^(KBContactsSelectionConfiguration *configuration) {
        configuration.mode = KBContactsSelectionModeMessages;
        configuration.shouldShowNavigationBar = NO;
        configuration.tintColor = [UIColor colorWithRed:11.0/255 green:211.0/255 blue:24.0/255 alpha:1];
    }];
    [vc setDelegate:self];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)present:(UIButton *)sender {
    
    KBContactsSelectionViewController *vc = [KBContactsSelectionViewController contactsSelectionViewControllerWithConfiguration:^(KBContactsSelectionConfiguration *configuration) {
        configuration.tintColor = [UIColor orangeColor];
        configuration.mode = KBContactsSelectionModeEmail;
    }];
    [vc setDelegate:self];
    [self presentViewController:vc animated:YES completion:nil];
}

#pragma mark - KBContactsSelectionViewControllerDelegate
- (void) didSelectContact:(APContact *)contact {
    NSLog(@"Selected contact: %@", [contact fullName]);
}

- (void) didRemoveContact:(APContact *)contact {
    NSLog(@"Removed contact: %@", [contact fullName]);
}

- (void) finishedReloading
{
    NSLog(@"Finished loading the data");
}

@end

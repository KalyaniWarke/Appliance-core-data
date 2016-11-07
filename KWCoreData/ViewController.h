//
//  ViewController.h
//  KWCoreData
//
//  Created by Kalyani on 05/10/16.
//  Copyright © 2016 Kalyani Warke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "AddViewController.h"
#import "customTableViewCell.h"
@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *tv;
    NSMutableArray *smartPhone;
    NSMutableArray *ac;
    UISegmentedControl *segments;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)segmentFirst:(id)sender;



- (IBAction)addBarButtonAction:(id)sender;


@end


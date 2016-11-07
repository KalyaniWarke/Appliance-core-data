//
//  AddViewController.h
//  KWCoreData
//
//  Created by Kalyani on 05/10/16.
//  Copyright © 2016 Kalyani Warke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddViewController : UIViewController<UITextFieldDelegate>
{
    UISegmentedControl *localSegment;
}
@property (weak, nonatomic) IBOutlet UITextField *field1;
@property (weak, nonatomic) IBOutlet UITextField *field2;
@property (weak, nonatomic) IBOutlet UITextField *field3;

- (IBAction)actionSave:(id)sender;

- (IBAction)actionCancel:(id)sender;

- (IBAction)segmentSecond:(id)sender;

@end

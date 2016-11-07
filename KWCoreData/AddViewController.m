//
//  AddViewController.m
//  KWCoreData
//
//  Created by Kalyani on 05/10/16.
//  Copyright © 2016 Kalyani Warke. All rights reserved.
//

#import "AddViewController.h"
#import "AppDelegate.h"


@interface AddViewController ()

@end

@implementation AddViewController

-(NSManagedObjectContext *)managedObjectContext {
    
    NSManagedObjectContext *context = nil;
    
    id delegate = [[UIApplication sharedApplication]delegate];
    
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        
        context = [delegate managedObjectContext];
        
    }
    return  context;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    
    if (textField == self.field1) {
        [self.field2 becomeFirstResponder];
    }
    else if (textField == self.field2)
    {
        [self.field3 becomeFirstResponder];
    }
    return YES;
}

- (IBAction)actionSave:(id)sender {
    
    NSString *name = self.field1.text;
    NSString *model = self.field2.text;
    NSString *company = self.field3.text;
    if (localSegment.selectedSegmentIndex == 0) {
        
        if (name.length > 0) {
            
            if (model.length >0) {
                
                if (company.length>0) {
                    
                    
                    NSManagedObjectContext *context = [self managedObjectContext];
                    
                    NSManagedObject *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"TV" inManagedObjectContext:context];
                    
                    [newDevice setValue:name forKey:@"model"];
                    
                    [newDevice setValue:model forKey:@"price"];
                    
                    [newDevice setValue:company forKey:@"year"];
                    
                    
                    //                    NSLog(@"%@",firstField);
                    //
                    //                    NSLog(@"%@",secondField);
                    //                    NSLog(@"%@",thirdField);
                    
                    
                    NSError *error;
                    
                    if ([context save:&error]) {
                        
                        NSLog(@"Saved");
                        
                        [self alertWithTitle:@"Saved!" message:@""];
                        
                        [self.navigationController popViewControllerAnimated:YES];
                    }
                    else{
                        NSLog(@"Unable to save : %@",error.localizedDescription);
                        
                        [self alertWithTitle:@"Unable to Save!" message:@"Please Try Again"];
                        
                        
                    }
                }
            }
        }
    }
//    if (localSegment.selectedSegmentIndex == 1) {
//        
//        if (name.length > 0) {
//            
//            if (model.length >0) {
//                
//                if (company.length>0) {
//                    
//                    
//                    NSManagedObjectContext *context = [self managedObjectContext];
//                    
//                    NSManagedObject *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"SmartPhone" inManagedObjectContext:context];
//                    
//                    [newDevice setValue:name forKey:@"company"];
//                    
//                    [newDevice setValue:model forKey:@"name"];
//                    
//                    [newDevice setValue:company forKey:@"price"];
//                    
//                    
//                    //                    NSLog(@"%@",firstField);
//                    //
//                    //                    NSLog(@"%@",secondField);
//                    //                    NSLog(@"%@",thirdField);
//                    
//                    
//                    NSError *error;
//                    
//                    if ([context save:&error]) {
//                        
//                        NSLog(@"Saved");
//                        
//                        [self alertWithTitle:@"Saved!" message:@""];
//                        
//                        [self.navigationController popViewControllerAnimated:YES];
//                    }
//                    else{
//                        NSLog(@"Unable to save : %@",error.localizedDescription);
//                        
//                        [self alertWithTitle:@"Unable to Save!" message:@"Please Try Again"];
//                        
//                        
//                    }
//                }
//            }
//        }
//    }
//    
//
    
    if (localSegment.selectedSegmentIndex == 1) {
        
        if (name.length > 0) {
            
            if (model.length >0) {
                
                if (company.length>0) {
                    
                    
                    NSManagedObjectContext *context = [self managedObjectContext];
                    
                    NSManagedObject *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"SmartPhone" inManagedObjectContext:context];
                    
                    [newDevice setValue:name forKey:@"name"];
                    
                    [newDevice setValue:model forKey:@"company"];
                    
                    [newDevice setValue:company forKey:@"price"];
                    
                    NSError *error;
                    
                    if ([context save:&error]) {
                        
                        NSLog(@"Saved");
                        
                       // [self alertWithTitle:@"Saved!" message:@""];
                        
                        [self.navigationController popViewControllerAnimated:YES];
                    }
                    else{
                        NSLog(@"Unable to save : %@",error.localizedDescription);
                        
                        [self alertWithTitle:@"Unable to Save!" message:@"Please Try Again"];
                        
                        
                    }
                }
            }
        }
    }
    if (localSegment.selectedSegmentIndex == 2) {
        
        if (name.length > 0) {
            
            if (model.length >0) {
                
                
                NSManagedObjectContext *context = [self managedObjectContext];
                
                NSManagedObject *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"AC" inManagedObjectContext:context];
                
                [newDevice setValue:name forKey:@"model_price"];
                
                [newDevice setValue:model forKey:@"price"];
                
                
                
                NSError *error;
                
                if ([context save:&error]) {
                    
                    NSLog(@"Saved");
                    
                 
                    
                    //[self alertWithTitle:@"Saved!" message:@""];
                    
                    
                    [self.navigationController popViewControllerAnimated:YES];
                }
                else{
                    NSLog(@"Unable to save : %@",error.localizedDescription);
                    
                   [self alertWithTitle:@"Unable to Save!" message:@"Please Try Again"];
                    
                    
                }
            }
        }
    }
    

    
    
    
}

    
    


- (IBAction)actionCancel:(id)sender {
    
    
   [self.navigationController popViewControllerAnimated:YES];
    
}

- (IBAction)segmentSecond:(id)sender {
    
    localSegment = sender;
    
    if (localSegment.selectedSegmentIndex == 0) {
        
        [self.field3 setHidden:NO];
        
        [_field1 setPlaceholder:@"Enter Model:"];
        
        [_field2 setPlaceholder:@"Enter Price:"];
        
        [_field3 setPlaceholder:@"Enter Year:"];
        
        
        [self actionSave:sender];
    }
    else if (localSegment.selectedSegmentIndex == 1) {
        
        [self.field3 setHidden:NO];
        
        [_field1 setPlaceholder:@"Enter Name:"];
        
        [_field2 setPlaceholder:@"Enter Company:"];
        
        [_field3 setPlaceholder:@"Enter Price:"];
        
        [self actionSave:sender];
    }
    else if (localSegment.selectedSegmentIndex == 2) {
        
        [self.field3 setHidden:YES];
        
        
        [_field1 setPlaceholder:@"Enter Model:"];
        
        [_field2 setPlaceholder:@"Enter Price:"];
        
        
        [self actionSave:sender];
    }
    


}
-(void)alertWithTitle: (NSString *)title message:(NSString *)message {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *OK =[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        
        [self dismissViewControllerAnimated:YES completion:nil];
        [self viewDidLoad];
    }];
    
    [alert addAction:OK];
    
    
    [self presentViewController:alert animated:YES completion:nil];
    
}


@end

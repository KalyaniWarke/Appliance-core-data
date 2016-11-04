//
//  ViewController.m
//  KWCoreData
//
//  Created by Kalyani on 05/10/16.
//  Copyright © 2016 Kalyani Warke. All rights reserved.
//

#import "ViewController.h"
#import "customTableViewCell.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController


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
    // Do any additional setup after loading the view, typically from a nib.
    tv =[[NSMutableArray alloc]init];
    smartPhone = [[NSMutableArray alloc]init];
    ac = [[NSMutableArray alloc]init];
    
    [self.tableView reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (segments.selectedSegmentIndex == 0) {
        return tv.count;
    }
    else if (segments.selectedSegmentIndex==1){
        return smartPhone.count;
    }
    else if (segments.selectedSegmentIndex==2){
        return ac.count;
    }
    return 0;
        
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    customTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"device_cell"];
    
    if(segments. selectedSegmentIndex==0){
    NSManagedObject *device =[tv objectAtIndex:indexPath.row];
    cell.label1.text = [device valueForKey:@"model"];
    
    cell.label2.text = [device valueForKey:@"price"];

    cell.label3.text = [device valueForKey:@"year"];
    }
    else if (segments.selectedSegmentIndex == 1){
        NSManagedObject *device =[smartPhone objectAtIndex:indexPath.row];
        cell.label1.text = [device valueForKey:@"name"];
        
        cell.label2.text = [device valueForKey:@"company"];
        
        cell.label3.text = [device valueForKey:@"price"];
    }
    else if (segments.selectedSegmentIndex == 2)
    {
        NSManagedObject *device =[ac objectAtIndex:indexPath.row];
        cell.label1.text = [device valueForKey:@"model_year"];
        
        cell.label2.text = [device valueForKey:@"price"];
        cell.label3.text=@"";
        
    }

    return cell;
}



-(void)fetchDeviceFromCoreData {
    
    NSManagedObjectContext *context = [self managedObjectContext];
    
    if (segments.selectedSegmentIndex == 0) {
        
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]initWithEntityName:@"TV"];
        
        NSError *error;
        tv = [[context executeFetchRequest:fetchRequest error:&error]mutableCopy];
        
        if (error) {
            
            [self alertWithTitle:@"Fetch Error" message:@"Please Try Again"];
            
            NSLog(@"%@",error.localizedDescription);
        }
        else {
            [self.tableView reloadData];
        }
    }
    else if (segments.selectedSegmentIndex == 1){
        
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]initWithEntityName:@"SmartPhone"];
        
        NSError *error;
        
        smartPhone = [[context executeFetchRequest:fetchRequest error:&error]mutableCopy];
        
        if (error) {
            
            [self alertWithTitle:@"Fetch Error" message:@"Please Try Again"];
            
            NSLog(@"%@",error.localizedDescription);
        }
        else {
            [self.tableView reloadData];
        }
        
    }
    
    else if (segments.selectedSegmentIndex == 2){
        
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]initWithEntityName:@"AC"];
        
        NSError *error;
        
        ac = [[context executeFetchRequest:fetchRequest error:&error]mutableCopy];
        
        if (error) {
           
            [self alertWithTitle:@"Fetch Error" message:@"Please Try Again"];
            
            NSLog(@"%@",error.localizedDescription);
        }
        else {
            [self.tableView reloadData];
        }
        
    }
    
    
}



- (IBAction)segmentFirst:(id)sender {
    
    
    if (segments .selectedSegmentIndex == 0) {
        [self.tableView reloadData];
    }
    else if (segments.selectedSegmentIndex == 1) {
        [self.tableView reloadData];
    }
    else if (segments.selectedSegmentIndex == 2) {
        
        [self.tableView reloadData];
    }

}

- (IBAction)addBarButtonAction:(id)sender {
    
    AddViewController *addView = [self.storyboard instantiateViewControllerWithIdentifier:@"AddViewController" ];
    
    [self.navigationController pushViewController:addView animated:YES];
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}



-(void)deleteEntry:(NSIndexPath *)indexPath {
    
    NSManagedObjectContext *context = [self managedObjectContext];
    
    if (segments.selectedSegmentIndex == 0) {
        
        [context deleteObject:[tv objectAtIndex:indexPath.row]];
        
        NSError *error;
        if ([context save:&error]) {
            NSLog(@"Deleted");
            
            [self alertWithTitle:@"Deleted!" message:@""];
            
            [self fetchDeviceFromCoreData];
            
            [self.tableView reloadData];
        }
        else {
            //show alert
            
            [self alertWithTitle:@"Error" message:@"Please Try Again"];
            
            NSLog(@"%@",error.localizedDescription);
            
        }
        
    }
    else if (segments.selectedSegmentIndex == 1) {
        
        [context deleteObject:[smartPhone objectAtIndex:indexPath.row]];
        
        NSError *error;
        if ([context save:&error]) {
            NSLog(@"Deleted");
            
            [self alertWithTitle:@"Deleted!" message:@""];
            
            [self fetchDeviceFromCoreData];
            
            [self.tableView reloadData];
            
        }
        else {
            //show alert
            
            [self alertWithTitle:@"Error" message:@"Please Try Again"];
            
            NSLog(@"%@",error.localizedDescription);
            
        }
        
    }
    else if (segments.selectedSegmentIndex == 2) {
        
        [context deleteObject:[ac objectAtIndex:indexPath.row]];
        
        NSError *error;
        if ([context save:&error]) {
            NSLog(@"Deleted");
            
            [self alertWithTitle:@"Deleted!" message:@""];
            
            
            [self fetchDeviceFromCoreData];
            
            [self.tableView reloadData];
            
        }
        else {
            //show alert
            [self alertWithTitle:@"Error" message:@"Please Try Again"];
            
            NSLog(@"%@",error.localizedDescription);
            
        }
        
    }
    
    
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [self deleteEntry:indexPath];
    }
    else{
        
        [self alertWithTitle:@"Can't Delete!" message:@"Please Try Again"];
        
        NSLog(@"alert cannot delete");
        
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

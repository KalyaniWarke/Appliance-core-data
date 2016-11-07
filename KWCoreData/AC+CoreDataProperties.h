//
//  AC+CoreDataProperties.h
//  KWCoreData
//
//  Created by Kalyani on 04/11/16.
//  Copyright © 2016 Kalyani Warke. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "AC.h"

NS_ASSUME_NONNULL_BEGIN

@interface AC (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *model_price;
@property (nullable, nonatomic, retain) NSString *price;

@end

NS_ASSUME_NONNULL_END

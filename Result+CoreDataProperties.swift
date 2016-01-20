//
//  Result+CoreDataProperties.swift
//  firstpagedraft
//
//  Created by Max Wray on 1/7/16.
//  Copyright © 2016 Max Wray. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Result {

    @NSManaged var healthretrieve: NSNumber?
    @NSManaged var toleranceretrieve: NSNumber?

}

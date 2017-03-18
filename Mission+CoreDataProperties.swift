//
//  Mission+CoreDataProperties.swift
//  Note List
//
//  Created by Carmen Chung on 11/18/16.
//  Copyright © 2016 Carmen Chung. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Mission {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Mission> {
        return NSFetchRequest<Mission>(entityName: "Mission");
    }

    @NSManaged public var details: String?

}

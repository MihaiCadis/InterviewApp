//
//  Thumbnail+CoreDataProperties.swift
//  
//
//  Created by Cadis Mihai on 27/02/2018.
//
//

import Foundation
import CoreData


extension Thumbnail {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Thumbnail> {
        return NSFetchRequest<Thumbnail>(entityName: "Thumbnail")
    }

    @NSManaged public var imageData: NSData?
    @NSManaged public var id: Double
    @NSManaged public var fullRes: FullRes?

}

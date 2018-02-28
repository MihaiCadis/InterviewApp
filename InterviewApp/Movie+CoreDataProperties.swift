//
//  Movie+CoreDataProperties.swift
//  
//
//  Created by Cadis Mihai on 27/02/2018.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var movieDetails: [String:String]?
    @NSManaged public var posterURL: String?
    @NSManaged public var titlu: String?

}

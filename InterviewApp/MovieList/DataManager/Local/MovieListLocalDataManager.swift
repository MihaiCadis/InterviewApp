//
//  MovieListLocalDataManager.swift
//  InterviewApp
//
//  Created by Cadis Mihai on 27/02/2018.
//  Copyright © 2018 Cadis Mihai. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class MovieListLocalDataManager: MovieListLocalInputDataManagerProtocol {
    
    
    
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    func retrieveMovieList() throws -> [Movie] {
        guard let managedObcjectContext = appDelegate?.persistentContainer.viewContext else {
            throw PersistanceError.managedObjectContextNotFound
            
        }
        
        let request: NSFetchRequest<Movie> = NSFetchRequest(entityName: "Movie")
        
        return try managedObcjectContext.fetch(request)
    }
    
    func savePost(title: String, details: [String : String], posterURL: String) throws{
        guard let managedObjectContext = appDelegate?.persistentContainer.viewContext else {
            throw PersistanceError.managedObjectContextNotFound
        }
        if let newMovie = NSEntityDescription.entity(forEntityName: "Movie", in: managedObjectContext) {
            let movie = Movie(entity: newMovie, insertInto: managedObjectContext)
            movie.titlu = title
            for (detail,detailText) in details{
                movie.movieDetails = "\(detail):\(detailText)" as NSObject
            }
            movie.posterURL = posterURL
            try managedObjectContext.save()
            
        }
    }
    
    
    
    
}

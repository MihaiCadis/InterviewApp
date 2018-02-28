//
//  MovieListRemoteDataManager.swift
//  InterviewApp
//
//  Created by Cadis Mihai on 27/02/2018.
//  Copyright © 2018 Cadis Mihai. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class MovieListRemoteDataManager: MovieListRemoteInputDataManagerProtocol {
    var remoteRequestHandler: MovieListRemoteOutputDataManagerProtocol?
    
    func retrieveMovieList() {
        
        Alamofire.request(Endpoints.Movies.fetch.url, method: .get).responseJSON { (response) in
            switch response.result {
            case .success(let movies):
                self.remoteRequestHandler?.onMoviesRetrieved(movies as! [MovieModel])
            case .failure(_):
                print("could not get data from server")
            }
        }
        
    }
}

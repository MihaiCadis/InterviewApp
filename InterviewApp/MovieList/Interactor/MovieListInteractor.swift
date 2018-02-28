//
//  MovieListInteractor.swift
//  InterviewApp
//
//  Created by Cadis Mihai on 27/02/2018.
//  Copyright © 2018 Cadis Mihai. All rights reserved.
//

import Foundation


class MovieListInteractor: MovieListInteractorInputProtocol {
    var presenter: MovieListInteractorOutputProtocol?
    
    var localDataManager: MovieListLocalInputDataManagerProtocol?
    
    var remoteDataManager: MovieListRemoteInputDataManagerProtocol?
    
    func retrieveMovieList() {
        do {
            if let movieList = try localDataManager?.retrieveMovieList() {
                let movieModelList = movieList.map() {
                    return MovieModel(titleToSet: ($0.titlu)!, detail: ($0.movieDetails)! as! [String : String], posterURLToSet: $0.posterURL!)
                }
                if movieModelList.isEmpty {
                    remoteDataManager?.retrieveMovieList()
                }
                else {
                    presenter?.didRetrieveMovies(movieModelList as! [MovieModel])
                }
                
            }
            else {
                remoteDataManager?.retrieveMovieList()
            }
            
        } catch {
            presenter?.didRetrieveMovies([])
        }

    }
}
extension MovieListInteractor: MovieListRemoteOutputDataManagerProtocol {
    func onMoviesRetrieved(_ movies: [MovieModel]) {
        presenter?.didRetrieveMovies(movies)
        
        for movieModel in movies {
            do {
                try localDataManager?.savePost(title: movieModel.title!, details: movieModel.movieDetails!, posterURL: movieModel.posterURL!)
            }
            catch {
                
            }
        }
    }
    
    
}















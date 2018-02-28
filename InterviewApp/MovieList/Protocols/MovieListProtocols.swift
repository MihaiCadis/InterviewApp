//
//  MovieListProtocols.swift
//  InterviewApp
//
//  Created by Cadis Mihai on 27/02/2018.
//  Copyright © 2018 Cadis Mihai. All rights reserved.
//

import Foundation
import UIKit



protocol MovieListViewProtocol: class {
    
    var presenter: MovieListPresenterProtocol? {get set}
    
    
    // Presenter --> View
    func showMovies(with movies: [MovieModel])
}
protocol MovieListPresenterProtocol: class {
    
    var view: MovieListViewProtocol? {get set}
    var interactor: MovieListInteractorInputProtocol? {get set}
    var wireFrame: MovieListWireFrameProtocol? {get set}
    
    // View --> Presenter
    func viewDidLoad()
    func showMovieDetail(forMovie movie: MovieModel)
}

protocol MovieListWireFrameProtocol: class {
    static func createMovieListModule() -> UITableViewController
    // Presenter --> WireFrame
    
    func presentMovieDetail(from view: MovieListViewProtocol, forMovie movie: MovieModel)
}


protocol MovieListInteractorInputProtocol: class {
    var presenter: MovieListInteractorOutputProtocol? {get set}
    var localDataManager: MovieListLocalInputDataManagerProtocol?  {get set}
    var remoteDataManager: MovieListRemoteInputDataManagerProtocol? {get set}
    
    // Presenter --> Iterator
    func retrieveMovieList()
}

protocol MovieListInteractorOutputProtocol: class {
    // Interactor --> Presenter
    
    func didRetrieveMovies(_ movies: [MovieModel])
    
}

protocol MovieListLocalInputDataManagerProtocol: class {
    // Interactor --> LocalDataManager
    
    func retrieveMovieList() throws -> [Movie]
    func savePost(title: String, details: [String: String], posterURL: String) throws
}

protocol MovieListRemoteInputDataManagerProtocol: class {
    var remoteRequestHandler: MovieListRemoteOutputDataManagerProtocol? {get set}
    
    // Interactor --> RemoteDataManager
    func retrieveMovieList()
}
protocol MovieListRemoteOutputDataManagerProtocol: class {
    
    // RemoteDataManager --> Interactor
    func onMoviesRetrieved(_ movies: [MovieModel])
    
}
















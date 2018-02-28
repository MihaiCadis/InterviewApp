//
//  MovieListWireFrame.swift
//  InterviewApp
//
//  Created by Cadis Mihai on 27/02/2018.
//  Copyright © 2018 Cadis Mihai. All rights reserved.
//

import UIKit


class MovieListWireFrame: MovieListWireFrameProtocol {
    static func createMovieListModule() -> UITableViewController {
        
        let view = MovieListView()
        let presenter: MovieListPresenterProtocol & MovieListInteractorOutputProtocol = MovieListPresenter()
        let interactor: MovieListInteractorInputProtocol & MovieListRemoteOutputDataManagerProtocol = MovieListInteractor()
        let localDataManager: MovieListLocalInputDataManagerProtocol = MovieListLocalDataManager()
        let remoteDataManager: MovieListRemoteInputDataManagerProtocol = MovieListRemoteDataManager()
        let wireFrame: MovieListWireFrameProtocol = MovieListWireFrame()
        
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.wireFrame = wireFrame
        interactor.localDataManager = localDataManager
        interactor.remoteDataManager = remoteDataManager
        interactor.presenter = presenter
        remoteDataManager.remoteRequestHandler = interactor
        
        return view
    }
    
    func presentMovieDetail(from view: MovieListViewProtocol, forMovie movie: MovieModel) {
        let movieDetailView = MovieDetailWireFrame.createMovieDetailModule(forMovie: movie)
        if let mainView = view as? UITabBarController {
            mainView.navigationController?.pushViewController(movieDetailView, animated: true)
        }
    }
    
    
}

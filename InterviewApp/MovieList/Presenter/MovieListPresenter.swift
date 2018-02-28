//
//  MovieListPresenter.swift
//  InterviewApp
//
//  Created by Cadis Mihai on 27/02/2018.
//  Copyright © 2018 Cadis Mihai. All rights reserved.
//




class MovieListPresenter: MovieListPresenterProtocol {
    var view: MovieListViewProtocol?
    
    var interactor: MovieListInteractorInputProtocol?
    
    var wireFrame: MovieListWireFrameProtocol?
    
    func viewDidLoad() {
        interactor?.retrieveMovieList()
    }
    
    func showMovieDetail(forMovie movie: MovieModel) {
        wireFrame?.presentMovieDetail(from: view!, forMovie: movie)
    }
}

extension MovieListPresenter: MovieListInteractorOutputProtocol {
    func didRetrieveMovies(_ movies: [MovieModel]) {
        view?.showMovies(with: movies)
    }
}

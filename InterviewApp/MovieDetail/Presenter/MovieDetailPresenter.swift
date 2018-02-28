//
//  MovieDetailPresenter.swift
//  InterviewApp
//
//  Created by Cadis Mihai on 28/02/2018.
//  Copyright © 2018 Cadis Mihai. All rights reserved.
//

import Foundation



class MovieDetailPresenter: MovieDetailPresenterProtocol {
    var view: MovieDetailViewProtocol?
    
    var wireFrame: MovieDetailWireFrameProtocol?
    
    var movie: MovieModel?
    
    func viewDidLoad() {
        view?.showDetail(forMovie: movie!)
    }
    
    
}

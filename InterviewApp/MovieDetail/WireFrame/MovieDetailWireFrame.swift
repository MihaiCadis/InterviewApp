//
//  MovieDetailWireFrame.swift
//  InterviewApp
//
//  Created by Cadis Mihai on 28/02/2018.
//  Copyright © 2018 Cadis Mihai. All rights reserved.
//

import Foundation
import UIKit



class MovieDetailWireFrame: MovieDetailWireFrameProtocol {
    static func createMovieDetailModule(forMovie movie: MovieModel) -> UIViewController {
        
        let view = MovieDetailView()
        let presenter: MovieDetailPresenterProtocol = MovieDetailPresenter()
        let wireFrame: MovieDetailWireFrameProtocol = MovieDetailWireFrame()
        
        
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.movie = movie
        
        return view
    }
    
    
    
    
}

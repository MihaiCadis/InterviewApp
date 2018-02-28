//
//  MovieDetailProtocol.swift
//  InterviewApp
//
//  Created by Cadis Mihai on 28/02/2018.
//  Copyright © 2018 Cadis Mihai. All rights reserved.
//

import Foundation
import UIKit



protocol MovieDetailViewProtocol: class {
    var presenter: MovieDetailPresenterProtocol? {get set}
    
    // Presenter --> View
    
    func showDetail(forMovie movie: MovieModel)
    
}

protocol MovieDetailPresenterProtocol: class {
    var view: MovieDetailViewProtocol? {get set}
    var wireFrame: MovieDetailWireFrameProtocol? {get set}
    var movie: MovieModel?  {get set}
    
    
    //View --> Presenter
    
    func viewDidLoad()

}

protocol MovieDetailWireFrameProtocol: class {
    static func createMovieDetailModule(forMovie movie: MovieModel) -> UIViewController
}

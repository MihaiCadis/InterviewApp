//
//  MovieDetailView.swift
//  InterviewApp
//
//  Created by Cadis Mihai on 28/02/2018.
//  Copyright © 2018 Cadis Mihai. All rights reserved.
//

import UIKit

class MovieDetailView: UIViewController {
    
    var presenter: MovieDetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDetailView()
        presenter?.viewDidLoad()
    }
    
    let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 24)
        return label
    }()
    
    let detailsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 24)
        return label
    }()
    
    func setUpDetailView() {
        
        view.addSubview(posterImageView)
        view.addSubview(titleLabel)
        view.addSubview(detailsLabel)
        
        // x,y,width,height constraints
        // posterImageView
        
        posterImageView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        posterImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        posterImageView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        posterImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/2).isActive = true
        
        // titleLabel
        
        titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 16).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: posterImageView.widthAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        
        // detailsLabel
        
        detailsLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        detailsLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        detailsLabel.widthAnchor.constraint(equalTo: titleLabel.widthAnchor).isActive = true
        detailsLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16).isActive = true
        
        
    }
}
extension MovieDetailView: MovieDetailViewProtocol {
    func showDetail(forMovie movie: MovieModel) {
        
        titleLabel.text = movie.title
        var description = ""
        for (key,value) in movie.movieDetails! {
            description += "\(key)\(value)"
        }
        detailsLabel.text = description
        self.posterImageView.loadImageUsingCacheWIthURLString(urlString: Endpoints.Movies.posterDownload.url)
    }
    
    
}

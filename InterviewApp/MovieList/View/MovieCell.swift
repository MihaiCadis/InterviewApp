//
//  MovieCell.swift
//  InterviewApp
//
//  Created by Cadis Mihai on 27/02/2018.
//  Copyright © 2018 Cadis Mihai. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    var movie: MovieModel? {
        didSet {
            
            setUpMovieCell()
        }
    }
    let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        textLabel?.frame = CGRect(x: 64, y: textLabel!.frame.origin.y - 2, width: textLabel!.frame.width, height: textLabel!.frame.height)
        detailTextLabel?.frame = CGRect(x: 64, y: detailTextLabel!.frame.origin.y + 2, width: detailTextLabel!.frame.width, height: detailTextLabel!.frame.height)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        
        addSubview(posterImageView)
        
        // iOS 9 constraints = x,y,width,height
        posterImageView.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 8).isActive = true
        posterImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        posterImageView.widthAnchor.constraint(equalToConstant: 48).isActive = true
        posterImageView.heightAnchor.constraint(equalToConstant: 48).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setUpMovieCell(){
        self.textLabel?.text = movie?.title
        self.detailTextLabel?.text = movie?.movieDetails!["Plot"]
        self.posterImageView.loadImageUsingCacheWIthURLString(urlString: Endpoints.Movies.posterDownload.url)
    }
    

}

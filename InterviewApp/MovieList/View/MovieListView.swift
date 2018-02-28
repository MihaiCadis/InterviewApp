//
//  ViewController.swift
//  InterviewApp
//
//  Created by Cadis Mihai on 27/02/2018.
//  Copyright © 2018 Cadis Mihai. All rights reserved.
//

import UIKit

class MovieListView: UITableViewController {
    
    var presenter: MovieListPresenterProtocol?
    var movieList: [MovieModel] = []
    let cellId = "CellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(statusManager), name: .flagsChanged, object: Network.reachability)
        updateUserInterface()
        presenter?.viewDidLoad()
        tableView.register(MovieCell.self, forCellReuseIdentifier: cellId)
    }
    
    func updateUserInterface() {
        guard let status = Network.reachability?.status else { return }
        switch status {
        case .unreachable:
            showNoInternetConnectionAlert()
        default: print("All sistems are good")
        }
        print("Reachability Summary")
        print("Status:", status)
        print("HostName:", Network.reachability?.hostname ?? "nil")
        print("Reachable:", Network.reachability?.isReachable ?? "nil")
        print("Wifi:", Network.reachability?.isReachableViaWiFi ?? "nil")
    }
    @objc func statusManager(_ notification: Notification) {
        updateUserInterface()
    }
    func showNoInternetConnectionAlert() {
        
        let noConnectionAlert = UIAlertController(title: "No Connection", message: "You are not connected to internet", preferredStyle: .alert)
        noConnectionAlert.addAction(UIAlertAction(title: "Go offline", style: .default, handler: nil))
        self.present(noConnectionAlert, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MovieCell
        
        let movieForCell = movieList[indexPath.row]
        cell.movie = movieForCell
        
        return cell
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = movieList[indexPath.row]
        presenter?.showMovieDetail(forMovie: movie)
    }
}
extension MovieListView: MovieListViewProtocol {
    func showMovies(with movies: [MovieModel]) {
        movieList = movies
        tableView.reloadData()
    }
    
    
}















//
//  Endpoints.swift
//  InterviewApp
//
//  Created by Cadis Mihai on 27/02/2018.
//  Copyright © 2018 Cadis Mihai. All rights reserved.
//

import Foundation


struct API {
    static let movieURL = "http://www.omdbapi.com"
    static let posterURL = "http://img.omdbapi.com"
}

protocol Endpoint {
    var path: String {get}
    var url: String {get}
}

enum Endpoints {
    enum Movies: Endpoint {
        case fetch
        case posterDownload
        
        public var path: String {
            switch self {
            case .fetch: return "/?i=tt3896198&apikey=c4a894af"
            case .posterDownload: return "/?i=tt3896198&apikey=c4a894af"
            }
        }
        public var url: String {
            switch self {
            case .fetch: return "\(API.movieURL)\(path)"
            case .posterDownload: return "\(API.posterURL)\(path)"
            }
        }
        
        
    }
}

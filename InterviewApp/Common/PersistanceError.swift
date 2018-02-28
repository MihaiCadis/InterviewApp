//
//  PersistanceError.swift
//  InterviewApp
//
//  Created by Cadis Mihai on 27/02/2018.
//  Copyright © 2018 Cadis Mihai. All rights reserved.
//

import Foundation



enum PersistanceError: Error {
    case managedObjectContextNotFound
    case couldNotSaveObject
    case objectNotFound
}

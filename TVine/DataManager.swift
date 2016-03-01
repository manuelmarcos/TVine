//
//  DataManager.swift
//  TVine
//
//  Created by Manuel Marcos Regalado on 28/02/2016.
//  Copyright © 2016 Manuel Marcos Regalado. All rights reserved.
//

import Foundation

public enum DataResult<Value> {
    case Success(Value)
    case Failure(NSError)
}

class DataManager  {
    
    // MARK: - posts methods
    
    func collectionOfPopularPosts(completionHandler: (DataResult<[Post]> -> Void)) {
        NetworkManager.sharedInstance.getPopular() { response in
            switch response.result {
            case .Success(let posts):
                completionHandler(DataResult<[Post]>.Success(posts))
            case .Failure(let error):
                completionHandler(DataResult.Failure(error))
            }
        }
    }
    
    // MARK: - Shared Instance
    
    static let sharedInstance = DataManager()
}

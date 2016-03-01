//
//  NetworkManager.swift
//  TVine
//
//  Created by Manuel Marcos Regalado on 13/02/2016.
//  Copyright © 2016 Manuel Marcos Regalado. All rights reserved.
//

import Alamofire

class NetworkManager {
    
    // MARK: - timelines methods
    
    func getPopular(completionHandler: (Response<[Post], NSError> -> Void)) {
        Alamofire.request(.GET, urlWithEndpoint(Constants.API.endPoints.timelines.popular), parameters: nil, encoding: ParameterEncoding.URL)
            .validate()
            .responseCollection(completionHandler)
    }
    
    // MARK: - Helpers
    
    private func urlWithEndpoint(endpoint: String) -> String {
        return "\(Constants.API.baseURL)\(endpoint)"
    }
    
    // MARK: - Shared Instance
    
    static let sharedInstance = NetworkManager()
}

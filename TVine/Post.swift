//
//  Post.swift
//  TVine
//
//  Created by Manuel Marcos Regalado on 28/02/2016.
//  Copyright © 2016 Manuel Marcos Regalado. All rights reserved.
//

import Foundation

final class Post: NSObject {

    var userName: String
    var videoUrl: String
    
    init(userName: String, videoUrl: String) {
        self.userName = userName
        self.videoUrl = videoUrl
    }
}

// Mark: - Alamofire ResponseObjectSerializable implementation

extension Post: ResponseObjectSerializable, ResponseCollectionSerializable  {
    
    convenience init?(response: NSHTTPURLResponse, representation: AnyObject) {
        if let videoUrlRepresentation = representation.valueForKeyPath(Constants.API.keys.videoUrl) as? String,
            userNameRepresentation = representation.valueForKeyPath(Constants.API.keys.userName) as? String {
                self.init(userName: userNameRepresentation, videoUrl: videoUrlRepresentation)
        } else {
            return nil
        }
    }
    
    static func collection(response response: NSHTTPURLResponse, representation: AnyObject) -> [Post] {
        var recordPosts: [Post] = [];
        if let representation = representation.valueForKeyPath(Constants.API.keys.data)!.valueForKeyPath(Constants.API.keys.records) as? [[String: AnyObject]] {
            for postRepresentation in representation {
                if let post = Post(response: response, representation: postRepresentation) {
                    recordPosts.append(post)
                }
            }
        }
        return recordPosts
    }
}

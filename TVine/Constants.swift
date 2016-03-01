//
//  Constants.swift
//  TVine
//
//  Created by Manuel Marcos Regalado on 28/02/2016.
//  Copyright © 2016 Manuel Marcos Regalado. All rights reserved.
//

import Foundation

struct Constants {
    struct API {
        static let baseURL = "https://api.vineapp.com/"
        struct endPoints {
            struct timelines {
                static let popular = "timelines/popular"
            }
            struct users {
                static let profiles = "users/profiles"
                static let search = "users/search"
            }
        }
        struct keys {
            static let data = "data"
            static let records = "records"
            static let videoUrl = "videoUrl"
            static let userName = "username"
        }
    }
}
//
//  bookURL.swift
//  day10
//
//  Created by Jessica Mallian on 4/26/19.
//  Copyright © 2019 Jessica Mallian. All rights reserved.
//

import Foundation

struct BookAPI {
    private static let baseURLString = "https://www.googleapis.com/books/v1/volumes"
    
    static func googleURL(search: String) -> URL {
        var components = URLComponents(string: baseURLString)!
        var queryItems = [URLQueryItem]()
        
        let paramseters = [
            "q": search.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed),
            "key": API.apiKey
        ]
        
        for (key, value) in paramseters {
            let item = URLQueryItem(name: key, value: value)
            queryItems.append(item)
        }
        
        components.queryItems = queryItems
        return components.url!
    }
}

//
//  bookURL.swift
//  day10
//
//  Created by Jessica Mallian on 4/26/19.
//  Copyright © 2019 Jessica Mallian. All rights reserved.
//

import Foundation

enum BookAPIError: Error {
    case invalidJSONData
    case unknownError 
}

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
    
    static func books(fromJSON data: Data) -> APIResult {
        do {
            let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
            guard let jsonDictionary = jsonObject as? [AnyHashable: Any], let items = jsonDictionary["items"] as? [[String: Any]] else {
                return .failure(BookAPIError.invalidJSONData)
            }
            var books = [Book]()
            for item in items {
                if let book = book(fromJSON: item) {
                    books.append(book)
                }
            }
            //TODO: make sure books is not empty 
            return .success(books)
        } catch {
            return .failure(error)
        }
    }
    
    private static func book(fromJSON json: [String: Any]) -> Book? {
        guard let volumeInfo = json["volumeInfo"] as? [String: Any],
            let title = volumeInfo["title"] as? String,
            let authors = volumeInfo["authors"] as? [String],
            let publishedDate = json["publishedDate"] as? String,
            let description = json["description"] as? String,
            let imageLinks = json["imageLinks"] as? [String: String],
            let imageLink = imageLinks["thumbnail"],
            let selfLink = json["selfLink"] as? String else {
                return nil
        }
        return Book(title: title, authors: authors, publishedDate: publishedDate, description: description, imageLink: imageLink, selfLink: selfLink)
    }
}

//
//  BookStore.swift
//  day10
//
//  Created by Jessica Mallian on 4/27/19.
//  Copyright © 2019 Jessica Mallian. All rights reserved.
//

import Foundation

enum BooksResult: Error {
    case success([Book])
    case failure(Error)
}

class BookStore {
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    func fetchBooks(about searchTerm: String, completion: @escaping (APIResult) -> Void) {
        let url = BookAPI.googleURL(search: searchTerm)
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) { (data, response, error) in
            let result = self.processBookRequest(data: data, error: error)
            completion(result)
        }
        task.resume()
    }
    
    private func processBookRequest(data: Data?, error: Error?) -> APIResult {
        guard let jsonData = data else {
            return .failure(error!) //TODO: deal with !
        }
        return BookAPI.books(fromJSON: jsonData)
    }
}

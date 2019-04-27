//
//  ViewController.swift
//  day10
//
//  Created by Jessica Mallian on 4/25/19.
//  Copyright © 2019 Jessica Mallian. All rights reserved.
//

import UIKit

enum APIResult {
    case success(Data)
    case failure(Error)
}

class ViewController: UIViewController {
    var data: [Book]?
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        callAPI(completion: process(apiResult:))
    }
    
    private func callAPI(completion: @escaping (APIResult) -> Void) {
        let url = BookAPI.googleURL(search: "pretty butterfly")
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                if let error = error {
                    completion(.failure(error))
                } else {
                    print("unknown error with api call")
                }
                return
            }
            completion(.success(data))
        }
        task.resume()
    }
    
    private func process(apiResult: APIResult) {
        switch apiResult {
        case let .success(apiData):
            data = createBooks(fromData: apiData)
        case .failure(_):
            print("failure with api call")
        }
    }
    
    private func createBooks(fromData data: Data) -> [Book]? {
        do {
            let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
            print(jsonObject)
        } catch {
            print(error)
        }
        return nil
    }
}


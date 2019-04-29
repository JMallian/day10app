//
//  ViewController.swift
//  day10
//
//  Created by Jessica Mallian on 4/25/19.
//  Copyright © 2019 Jessica Mallian. All rights reserved.
//

import UIKit

enum APIResult {
    case success([Book])
    case failure(Error)
}

class BooksTableViewController: UITableViewController {
    var data: [Book]?
    var bookStore: BookStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        bookStore.fetchBooks(about: "democracy") { (apiResult) in
            switch apiResult {
            case let .success(books):
                self.data = books
                print("success! have \(books.count) books")
                if let books = self.data {
                    for book in books {
                        print(book.title)
                        print(book.description)
                        print("")
                    }
                }
            case let .failure(error):
                print("error in ViewController.viewDidLoad: \(error)")
            }
        }
        let url = BookAPI.googleURL(search: "pizza")
        print(url)
    }
}


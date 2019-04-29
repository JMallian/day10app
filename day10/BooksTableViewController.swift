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
        fetchBooksForTable()
    }
    
    private func fetchBooksForTable() {
        bookStore.fetchBooks(about: "democracy") { (apiResult) in
            switch apiResult {
            case let .success(books):
                self.data = books
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case let .failure(error):
                print("error in ViewController.viewDidLoad: \(error)")
            }
        }
    }
    
    //MARK: tableView functions
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath)
        cell.textLabel?.text = data?[indexPath.row].title
        var authors = ""
        if let authorsArr = data?[indexPath.row].authors {
            authors = authorsArr.joined(separator: ", ")
        }
        cell.detailTextLabel?.text = authors
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.count ?? 0
    }
}


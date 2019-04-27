//
//  ViewController.swift
//  day10
//
//  Created by Jessica Mallian on 4/25/19.
//  Copyright © 2019 Jessica Mallian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    private func callAPI() {
        let url = BookAPI.googleURL(search: "pretty butterfly")
    }
}


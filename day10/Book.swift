//
//  Book.swift
//  day10
//
//  Created by Jessica Mallian on 4/25/19.
//  Copyright © 2019 Jessica Mallian. All rights reserved.
//

import Foundation

class Book {
    let title: String
    let authors: [String]
    let publishedDate: Date
    let description: String
    let imageLink: String
    let selfLink: String
    
    init(title: String, authors: [String], publishedDate: Date, description: String, imageLink: String, selfLink: String) {
        self.title = title
        self.authors = authors
        self.publishedDate = publishedDate
        self.description = description
        self.imageLink = imageLink
        self.selfLink = selfLink
    }
}

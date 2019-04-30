//
//  BookInfoViewController.swift
//  day10
//
//  Created by Jessica Mallian on 4/29/19.
//  Copyright © 2019 Jessica Mallian. All rights reserved.
//

import UIKit

class BookInfoViewController: UIViewController {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    var book: Book?
    
    override func viewDidLoad() {
        titleLabel.text = book?.title
        authorLabel.text = book?.authors.joined(separator: ", ")
        dateLabel.text = book?.publishedDate
        descriptionLabel.text = book?.description
    }
    
}

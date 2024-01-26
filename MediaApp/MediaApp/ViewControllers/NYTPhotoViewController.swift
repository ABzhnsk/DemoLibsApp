//
//  NYTPhotoViewController.swift
//  MediaApp
//
//  Created by Anna Buzhinskaya on 26.01.2024.
//


import UIKit


final class NYTPhotoViewController: UITableViewController {
    
    var imageURL = URL(string: "https://cataas.com/cat")!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        tableView.separatorStyle = .none

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

    private lazy var cell = ImageViewCell()
}

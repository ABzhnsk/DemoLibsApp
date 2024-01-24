//
//  LibsViewController.swift
//  MediaApp
//
//  Created by Anna Buzhinskaya on 11.01.2024.
//

import UIKit

class LibsViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        libsName.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var config = cell.defaultContentConfiguration()
        config.text = libsName[indexPath.row]
        cell.contentConfiguration = config
        cell.selectionStyle = .none
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(CabbageViewController(), animated: true)
    }

    private let libsName = [
        "Cabbage - video",
        "Player - video",
        "NYTPhotoViewer - photo",
        "Lightbox - photo",
        "Lightbox - video",
        "ImageViewer - photo",
        "ImageViewer - video",
    ]

} // class LibsViewController


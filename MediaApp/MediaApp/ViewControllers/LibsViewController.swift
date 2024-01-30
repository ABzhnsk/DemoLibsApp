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
        switch indexPath.row {
            case 0: 
                let cabbageVideoViewController = CabbageVideoViewController()
                cabbageVideoViewController.title = libsName[0]
                navigationController?.pushViewController(cabbageVideoViewController, animated: true)
            case 1:
                let playerVideoViewController = PlayerVideoViewController()
                playerVideoViewController.title = libsName[1]
                navigationController?.pushViewController(playerVideoViewController, animated: true)
            case 2:
                let nytPhotoViewerViewController = NYTPhotoViewerViewController()
                nytPhotoViewerViewController.title = libsName[2]
                navigationController?.pushViewController(nytPhotoViewerViewController, animated: true)
            case 3:
                let lightboxPhotoViewController = LightboxPhotoViewController()
                lightboxPhotoViewController.title = libsName[3]
                navigationController?.pushViewController(lightboxPhotoViewController, animated: true)
            case 4:
                let lightboxVideoViewController = LightboxVideoViewController()
                lightboxVideoViewController.title = libsName[4]
                navigationController?.pushViewController(lightboxVideoViewController, animated: true)
            case 5:
                let agrumePhotoViewController = AgrumePhotoViewController()
                agrumePhotoViewController.title = libsName[5]
                navigationController?.pushViewController(agrumePhotoViewController, animated: true)
            default:
                navigationController?.pushViewController(CabbageVideoViewController(), animated: true)
        }
    }

    private let libsName = [
        "Cabbage - video",
        "Player - video",
        "NYTPhotoViewer - photo",
        "Lightbox - photo",
        "Lightbox - video",
        "Agrume - photo"
    ]

} // class LibsViewController


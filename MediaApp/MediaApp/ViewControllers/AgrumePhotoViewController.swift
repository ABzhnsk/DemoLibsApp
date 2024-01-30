//
//  AgrumePhotoViewController.swift
//  MediaApp
//
//  Created by Anna Buzhinskaya on 30.01.2024.
//


import UIKit
import Agrume
import SDWebImage


final class AgrumePhotoViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        tableView.separatorStyle = .none
        title = "Agrume"

        let imageURL = URL(string: "https://cataas.com/cat")!

        // Use SDWebImage to get image from URL

        SDWebImageManager.shared.loadImage(with: imageURL, progress: nil) {
            image, _, _, _, _, url in
            guard let image, let url, url == imageURL else { return }
            self.image = image
            self.tableView.reloadData()
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ImageCell()
        cell.image = image
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 1. Create Agrume with image and button
        // by default, nil is the "Close" button in left side
        let agrume = Agrume(image: image!, dismissal: .withButton(nil)) // TODO: remove force unwrapping
        // 2. Show image
        agrume.show(from: self)

        /* Download image with Agrume and SDWebImage
        let imageURL = URL(string: "https://cataas.com/cat")!
        let agrume = Agrume(url: imageURL)
        agrume.download = { agrumeURL, completion in
            SDWebImageManager.shared.loadImage(with: agrumeURL, progress: nil) {
                image, _, _, _, _, url in
                guard let image, let url, url == agrumeURL else { return }
                completion(image)
            }
        }
        agrume.show(from: self)
         */
    }

    private var image: UIImage?
} // class AgrumePhotoViewController

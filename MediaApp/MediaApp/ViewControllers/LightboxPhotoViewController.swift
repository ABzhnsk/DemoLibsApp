//
//  LightboxPhotoViewController.swift
//  MediaApp
//
//  Created by Anna Buzhinskaya on 28.01.2024.
//


import UIKit
import Lightbox
import SDWebImage


final class LightboxPhotoViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        tableView.separatorStyle = .none

        let imageURL = URL(string: "https://cataas.com/cat")!

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
        // 1. Create LightboxController with LightboxImage
        let controller = LightboxController(images: [LightboxImage(image: image!)])
        // 2. Use dynamic background, otherwise, the screen will be displayed incorrectly
        controller.dynamicBackground = true
        // 3. Show controller
        present(controller, animated: true)
    }

    private var image: UIImage?
} // class LightboxPhotoViewController

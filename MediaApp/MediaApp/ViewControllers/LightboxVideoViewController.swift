//
//  LightboxVideoViewController.swift
//  MediaApp
//
//  Created by Anna Buzhinskaya on 29.01.2024.
//


import AVFoundation
import UIKit
import Lightbox


final class LightboxVideoViewController: UITableViewController {

    var videoURL = URL(string: "https://v3.cdnpk.net/videvo_files/video/free/2019-11/large_preview/190301_1_25_11.mp4")!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        tableView.separatorStyle = .none

        // Use AVAssetImageGenerator to set preview image from video in cell

        let imageGenerator = AVAssetImageGenerator(asset: AVAsset(url: videoURL))
        imageGenerator.appliesPreferredTrackTransform = true
        
        imageGenerator.generateCGImagesAsynchronously(forTimes: [NSValue.init(time: .zero)]) {
            [weak self] (_, cgImage, _, _, _) in
            if let cgImage {
                DispatchQueue.main.async {
                    self?.image = UIImage(cgImage: cgImage)
                    self?.tableView.reloadData()
                }
            } else {
                print("load thumb image failed") // TODO: add error handling
            }
        }

        // LightboxConfig allows to customize the elements of the LightboxController

        LightboxConfig.CloseButton.text = "Finish"
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = PreviewVideoCell()
        cell.image = image
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 1. Create LightboxController with videoURL in LightboxImage
        // The videoURL parameter adds a play button in the center
        // Clicking on the button opens the AVPlayerViewController
        let images = LightboxImage(image: image!, text: "test", videoURL: videoURL) // TODO: remove force unwrapping
        let controller = LightboxController(images: [images])
        // 2. Use dynamic background, otherwise, the screen will be displayed incorrectly
        controller.dynamicBackground = true
        // 3. Show controller
        present(controller, animated: true)
    }

    private var image: UIImage?
} // class LightboxVideoViewController

//
//  CabbageViewController.swift
//  MediaApp
//
//  Created by Anna Buzhinskaya on 22.01.2024.
//

import AVKit
import AVFoundation
import UIKit
import SwifterSwift
import VFCabbage


final class CabbageViewController: UITableViewController {

    var videoURL = URL(string: "https://v3.cdnpk.net/videvo_files/video/free/2019-11/large_preview/190301_1_25_11.mp4")!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        tableView.separatorStyle = .none

        // 1. Create a resource
        let asset = AVAsset(url: videoURL) // FIXME: spends traffic every time the controller is loaded
        let resource = AVAssetTrackResource(asset: asset)

        // 2. Create a TrackItem instance, TrackItem can configure video&audio configuration
        let trackItem = TrackItem(resource: resource)
        // Set the video scale mode on canvas
        trackItem.videoConfiguration.contentMode = .aspectFill

        // 3. Add TrackItem to timeline
        let timeline = Timeline()
        timeline.videoChannel = [trackItem]
        timeline.audioChannel = [trackItem]

        // 4. Use CompositionGenerator to create AVPlayerItem
        let compositionGenerator = CompositionGenerator(timeline: timeline)
        // Set the video canvas's size
        compositionGenerator.timeline.renderSize = CGSize(width: 1920, height: 1080)

        // 5. Create AVPlayerItem
        let playerItem = compositionGenerator.buildPlayerItem()

        // 6. Create AVAssetImageGenerator
        let imageGenerator = compositionGenerator.buildImageGenerator()
        imageGenerator.appliesPreferredTrackTransform = true

        // 7. Setup image to imageView in cell
        imageGenerator.generateCGImagesAsynchronously(forTimes: [NSValue.init(time: .zero)]) {
            [weak self] (_, cgImage, _, _, _) in
            if let cgImage {
                DispatchQueue.main.async {
                    self?.cell.image = UIImage(cgImage: cgImage)
                }
            } else {
                print("load thumb image failed") // TODO: add error handling
            }
        }

        // 8. Add player to avPlayerViewController
        avPlayerViewController.player = AVPlayer(playerItem: playerItem)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.present(avPlayerViewController, animated: true)
    }

    private let avPlayerViewController = AVPlayerViewController()
    private lazy var cell = Cell()
} // class CabbageViewController


private extension CabbageViewController {
    final class Cell: UITableViewCell {
        var image: UIImage? { didSet {
            screensaverImageView.image = nil
            if let image {
                screensaverImageView.image = image
            }
        }}

        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            selectionStyle = .none
            contentView.addSubview(screensaverImageView)
            screensaverImageView.anchor(top: contentView.topAnchor,
                                        left: contentView.layoutMarginsGuide.leftAnchor,
                                        bottom: contentView.bottomAnchor,
                                        right: contentView.layoutMarginsGuide.rightAnchor)
            let ratioConstraint = screensaverImageView.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: CGFloat(9)/16)
            ratioConstraint.priority = .defaultHigh
            ratioConstraint.isActive = true
        }

        required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

        private lazy var screensaverImageView = UIImageView()
    } // class Cell
} // extension CabbageViewController


final class CabbageViewController111: UIViewController {

    override func loadView() {
        view = UIScrollView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground

        scrollView.alwaysBounceVertical = true
        scrollView.preservesSuperviewLayoutMargins = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false

        // Content

        let contentView = UIView()
        contentView.preservesSuperviewLayoutMargins = true
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)

        // Player

        let url = URL(string: "https://v3.cdnpk.net/videvo_files/video/free/2019-11/large_preview/190301_1_25_11.mp4")!

        // 1. Create a resource
        let asset = AVAsset(url: url)
        let resource = AVAssetTrackResource(asset: asset)

        // 2. Create a TrackItem instance, TrackItem can configure video&audio configuration
        let trackItem = TrackItem(resource: resource)
        // Set the video scale mode on canvas
        trackItem.videoConfiguration.contentMode = .aspectFill

        // 3. Add TrackItem to timeline
        let timeline = Timeline()
        timeline.videoChannel = [trackItem]
        timeline.audioChannel = [trackItem]

        // 4. Use CompositionGenerator to create AVPlayerItem
        let compositionGenerator = CompositionGenerator(timeline: timeline)
        // Set the video canvas's size
        compositionGenerator.timeline.renderSize = CGSize(width: 1920, height: 1080)

        // 5. Create AVPlayerItem
        let playerItem = compositionGenerator.buildPlayerItem()

        // 6. Create player
        let player = AVPlayer(playerItem: playerItem)
        player.play()

        // 7. Set player to avPlayerViewController
        avPlayerViewController.player = player

        contentView.addSubview(avPlayerViewController.view)

        // Constraints

        avPlayerViewController.view.anchor(
            top: contentView.topAnchor,
            left: contentView.layoutMarginsGuide.leftAnchor,
            right: contentView.layoutMarginsGuide.rightAnchor
        )

        NSLayoutConstraint.activate([
            scrollView.contentLayoutGuide.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.leftAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leftAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.rightAnchor.constraint(equalTo: scrollView.contentLayoutGuide.rightAnchor),
            avPlayerViewController.view.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 9 / 16)
        ])
    }

    private let avPlayerViewController = AVPlayerViewController()
    private var scrollView: UIScrollView { view as! UIScrollView }
} // class CabbageViewController111

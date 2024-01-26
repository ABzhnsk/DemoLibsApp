//
//  PlayerDetailsViewController.swift
//  MediaApp
//
//  Created by Anna Buzhinskaya on 18.01.2024.
//

import UIKit
import Player
import SwifterSwift


final class PlayerDetailsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        // TODO: it is loaded every time the controller is opened
        player.url = URL(string: "https://v3.cdnpk.net/videvo_files/video/free/2019-11/large_preview/190301_1_25_11.mp4")

        // Gesture recognizer

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handlePlayerTap(_:)))
        player.view.addGestureRecognizer(tapGesture)

        // Setup view

        view.addSubview(player.view)
        player.view.frame = view.bounds
    }

    @objc private func handlePlayerTap(_ gestureRecognizer: UITapGestureRecognizer) {
        switch player.playbackState {
            case .stopped:
                player.playFromBeginning()
            case .paused:
                player.playFromCurrentTime()
            case .playing, .failed:
                player.pause()
        }
    }

    private lazy var player: Player = {
        let player = Player()
        player.fillMode = .resizeAspect
        return player
    }()
}

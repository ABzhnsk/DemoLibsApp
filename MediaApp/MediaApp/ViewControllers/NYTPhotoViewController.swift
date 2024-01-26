//
//  NYTPhotoViewController.swift
//  MediaApp
//
//  Created by Anna Buzhinskaya on 26.01.2024.
//


import UIKit
import SDWebImage
import NYTPhotoViewer


final class NYTPhotoViewerViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        tableView.separatorStyle = .none

        let imageURL = URL(string: "https://cataas.com/cat")!

        SDWebImageManager.shared.loadImage(with: imageURL, progress: nil) { 
            image, _, _, _, _, url in
            guard let image, let url, url == imageURL else { return }
            self.image = image
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Cell()
        cell.image = image
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nytPhotosViewController = NYTPhotosViewController(dataSource: self)
        self.present(nytPhotosViewController, animated: true)
    }

    private var image: UIImage?
} // class NYTPhotoViewerViewController


extension NYTPhotoViewerViewController: NYTPhotoViewerDataSource {
    var numberOfPhotos: NSNumber? {
        1
    }
    
    func index(of photo: NYTPhoto) -> Int {
        1
    }
    
    func photo(at photoIndex: Int) -> NYTPhoto? {
        let photoBox = PhotoBox()
        photoBox.image = image
        photoBox.placeholderImage = UIImage(systemName: "camera")
        return photoBox
    }
} // extension NYTPhotoViewerViewController


private extension NYTPhotoViewerViewController {

    final class Cell: UITableViewCell {
        var image: UIImage? { didSet {
            pictureView.image = nil
            if let image {
                pictureView.image = image
            }
        }}

        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            selectionStyle = .none
            pictureView.contentMode = .scaleAspectFill
            pictureView.clipsToBounds = true
            contentView.addSubview(pictureView)
            pictureView.anchor(top: contentView.topAnchor,
                               left: contentView.layoutMarginsGuide.leftAnchor,
                               bottom: contentView.bottomAnchor,
                               right: contentView.layoutMarginsGuide.rightAnchor)
            pictureView.heightAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        }

        required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

        private lazy var pictureView = UIImageView()
    } // class Cell

    /// NYTPhoto
    final class PhotoBox: NSObject, NYTPhoto {
        var image: UIImage?
        var imageData: Data?
        var placeholderImage: UIImage?
        var attributedCaptionTitle: NSAttributedString?
        var attributedCaptionSummary: NSAttributedString?
        var attributedCaptionCredit: NSAttributedString?
    } // class PhotoBox
} // extension NYTPhotoViewerViewController
